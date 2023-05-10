package eu.nk2.tinkoff_acquiring_sdk

import android.os.Handler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

typealias MethodChannelFunction = (call: MethodCall, result: MethodChannel.Result, delegate: TinkoffAcquiringSdkDelegate, scope: Handler) -> Unit

fun safe(function: MethodChannelFunction): MethodChannelFunction =
    { call, result, delegate, scope ->
        try {
            function(call, result, delegate, scope)
        } catch (e: Exception) {
            result.error(TINKOFF_COMMON_STATUS_FATAL_ERROR, e.message, null)
        }
    }

private const val TINKOFF_INITIALIZE_ID = "initialize"
private val tinkoffInitialize: MethodChannelFunction = safe { call, result, delegate, scope ->
    delegate.initialize(
        isDebug = call.argument("isDebug") ?: false,
        isDeveloperMode = call.argument("isDeveloperMode") ?: false,
        terminalKey = call.argument("terminalKey")
            ?: error("terminalKey is required in initialize method"),
        publicKey = call.argument("publicKey")
            ?: error("publicKey is required in initialize method"),
        enableGooglePay = call.argument("enableGooglePay") ?: false,
        requireAddress = call.argument("requireAddress") ?: false,
        requirePhone = call.argument("requirePhone") ?: false
    ) { methodCallResult ->
        scope.post {
            result.success(
                mapOf(
                    "status" to methodCallResult.status.name
                )
            )
        }
    }

}

private const val TINKOFF_OPEN_ATTACH_SCREEN = "openAttachCardScreen"
private val tinkoffOpenAttachCardScreen: MethodChannelFunction =
    safe { call, result, delegate, scope ->
        delegate.openAttachCardScreen(
            tinkoffCustomerOptions = call.toTinkoffCustomerOptions(),
            tinkoffFeaturesOptions = call.toTinkoffFeaturesOptions()
        ) { methodCallResult ->

            scope.post {
                result.success(
                    mapOf(
                        "status" to methodCallResult.status.name,
                        "error" to methodCallResult.error?.message,
                        "cardId" to methodCallResult.cardId
                    )
                )
            }
        }
    }

private const val TINKOFF_OPEN_PAYMENT_SCREEN = "openPaymentScreen"
private val tinkoffOpenPaymentScreen: MethodChannelFunction =
    safe { call, result, delegate, scope ->
        delegate.openPaymentScreen(
            tinkoffOrderOptions = call.toTinkoffOrderOptions(),
            tinkoffCustomerOptions = call.toTinkoffCustomerOptions(),
            tinkoffFeaturesOptions = call.toTinkoffFeaturesOptions()
        ) { methodCallResult ->
            scope.post {
                result.success(
                    mapOf(
                        "status" to methodCallResult.status.name,
                        "error" to methodCallResult.error?.message,
                        "cardId" to methodCallResult.cardId,
                        "paymentId" to methodCallResult.paymentId
                    )
                )
            }
        }
    }

private const val TINKOFF_OPEN_GOOGLE_PAY = "openGooglePay"
private val tinkoffOpenGooglePay: MethodChannelFunction = safe { call, result, delegate, scope ->
    val tinkoffOrderOptions = call.toTinkoffOrderOptions()
    val tinkoffCustomerOptions = call.toTinkoffCustomerOptions()
    val tinkoffFeaturesOptions = call.toTinkoffFeaturesOptions()

    delegate.openGooglePay(
        tinkoffOrderOptions, tinkoffCustomerOptions, tinkoffFeaturesOptions
    ) { methodCallResult ->
        when (methodCallResult.status) {
            TinkoffAcquiringSdkDelegate.TinkoffAcquiringDelegateOpenGooglePayStatus.RESULT_REOPEN_UI -> {
                delegate.openPaymentScreen(
                    tinkoffOrderOptions,
                    tinkoffCustomerOptions,
                    tinkoffFeaturesOptions,
                    methodCallResult.paymentState
                ) { methodCallResult2 ->
                    scope.post {
                        result.success(
                            mapOf(
                                "status" to methodCallResult2.status.name,
                                "error" to methodCallResult2.error?.message,
                                "cardId" to methodCallResult2.cardId,
                                "paymentId" to methodCallResult2.paymentId
                            )
                        )
                    }
                }
            }
            else -> scope.post {
                result.success(
                    mapOf(
                        "status" to methodCallResult.status.name,
                        "error" to methodCallResult.error?.message,
                        "cardId" to methodCallResult.cardId,
                        "paymentId" to methodCallResult.paymentId,
                        "rebillId" to methodCallResult.rebillId
                    )
                )
            }
        }
    }

}

private const val TINKOFF_OPEN_PAYMENT_QR_SCREEN = "openPaymentQrScreen"
private val tinkoffOpenPaymentQrScreen: MethodChannelFunction =
    safe { call, result, delegate, scope ->
        delegate.openPaymentQrScreen(
            tinkoffFeaturesOptions = call.toTinkoffFeaturesOptions()
        ) { methodCallResult ->

            scope.post {
                result.success(
                    mapOf(
                        "status" to methodCallResult.status.name,
                        "error" to methodCallResult.error?.message
                    )
                )
            }
        }
    }

private const val TINKOFF_OPEN_SAVED_CARDS_SCREEN = "openSavedCardsScreen"
private val tinkoffOpenSavedCardsScreen: MethodChannelFunction =
    safe { call, result, delegate, scope ->
        delegate.openSavedCardsScreen(
            tinkoffCustomerOptions = call.toTinkoffCustomerOptions(),
            tinkoffFeaturesOptions = call.toTinkoffFeaturesOptions()
        ) { methodCallResult ->

            scope.post {
                result.success(
                    mapOf(
                        "status" to methodCallResult.status.name,
                        "error" to methodCallResult.error?.message
                    )
                )
            }
        }
    }

val tinkoffMethodBundle = mapOf(
    TINKOFF_INITIALIZE_ID to tinkoffInitialize,
    TINKOFF_OPEN_ATTACH_SCREEN to tinkoffOpenAttachCardScreen,
    TINKOFF_OPEN_PAYMENT_SCREEN to tinkoffOpenPaymentScreen,
    TINKOFF_OPEN_GOOGLE_PAY to tinkoffOpenGooglePay,
    TINKOFF_OPEN_PAYMENT_QR_SCREEN to tinkoffOpenPaymentQrScreen,
    TINKOFF_OPEN_SAVED_CARDS_SCREEN to tinkoffOpenSavedCardsScreen
)