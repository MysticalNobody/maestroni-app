package eu.nk2.tinkoff_acquiring_sdk

import android.app.Activity
import com.google.android.gms.wallet.AutoResolveHelper
import com.google.android.gms.wallet.WalletConstants
import ru.tinkoff.acquiring.sdk.AcquiringSdk
import ru.tinkoff.acquiring.sdk.TinkoffAcquiring
import ru.tinkoff.acquiring.sdk.models.AsdkState
import ru.tinkoff.acquiring.sdk.models.DefaultState
import ru.tinkoff.acquiring.sdk.models.GooglePayParams
import ru.tinkoff.acquiring.sdk.payment.PaymentListenerAdapter
import ru.tinkoff.acquiring.sdk.utils.GooglePayHelper
import java.util.logging.Level
import java.util.logging.Logger

class TinkoffAcquiringSdkDelegate(private val activityDelegate: ActivityDelegate) {

    private var tinkoffAcquiring: TinkoffAcquiring? = null
    private var googlePayHelper: GooglePayHelper? = null


    data class TinkoffAcquiringDelegateInitializeResponse(
        val status: TinkoffAcquiringDelegateInitializeStatus
    )

    enum class TinkoffAcquiringDelegateInitializeStatus { RESULT_OK, GOOGLE_PAY_NOT_AVAILABLE, FLUTTER_NOT_INITIALIZED, PLUGIN_ALREADY_INITIALIZED }

    fun initialize(
        isDebug: Boolean,
        isDeveloperMode: Boolean,
        terminalKey: String,
        publicKey: String,
        enableGooglePay: Boolean,
        requireAddress: Boolean,
        requirePhone: Boolean,
        handler: (TinkoffAcquiringDelegateInitializeResponse) -> Unit
    ) {
        AcquiringSdk.isDeveloperMode = isDeveloperMode
        AcquiringSdk.isDebug = isDebug
        if (activityDelegate.activity == null || activityDelegate.context == null) return handler(
            TinkoffAcquiringDelegateInitializeResponse(status = TinkoffAcquiringDelegateInitializeStatus.FLUTTER_NOT_INITIALIZED)
        )
        if (tinkoffAcquiring != null || googlePayHelper != null) return handler(
            TinkoffAcquiringDelegateInitializeResponse(status = TinkoffAcquiringDelegateInitializeStatus.PLUGIN_ALREADY_INITIALIZED)
        )


        tinkoffAcquiring = TinkoffAcquiring(terminalKey, publicKey)

        if (!enableGooglePay) return handler(TinkoffAcquiringDelegateInitializeResponse(status = TinkoffAcquiringDelegateInitializeStatus.RESULT_OK))
        else {
            googlePayHelper = GooglePayHelper(
                GooglePayParams(
                    terminalKey = terminalKey,
                    environment = if (isDeveloperMode) WalletConstants.ENVIRONMENT_TEST else WalletConstants.ENVIRONMENT_PRODUCTION,
                    isAddressRequired = requireAddress,
                    isPhoneRequired = requirePhone
                )
            )

            googlePayHelper!!.initGooglePay(activityDelegate.context!!) { ready ->
                if (ready) handler(TinkoffAcquiringDelegateInitializeResponse(status = TinkoffAcquiringDelegateInitializeStatus.RESULT_OK))
                else handler(TinkoffAcquiringDelegateInitializeResponse(status = TinkoffAcquiringDelegateInitializeStatus.GOOGLE_PAY_NOT_AVAILABLE))
            }
        }
    }

    data class TinkoffAcquiringDelegateOpenAttachScreenResponse(
        val status: TinkoffAcquiringDelegateOpenAttachScreenStatus,
        val error: Throwable? = null,
        val cardId: String? = null
    )

    enum class TinkoffAcquiringDelegateOpenAttachScreenStatus { RESULT_OK, RESULT_CANCELLED, RESULT_NONE, RESULT_ERROR, ERROR_NOT_INITIALIZED, ERROR_NO_ACTIVITY }

    fun openAttachCardScreen(
        tinkoffCustomerOptions: TinkoffCustomerOptions,
        tinkoffFeaturesOptions: TinkoffFeaturesOptions,
        handler: (TinkoffAcquiringDelegateOpenAttachScreenResponse) -> Unit
    ) {
        if (tinkoffAcquiring == null) return handler(
            TinkoffAcquiringDelegateOpenAttachScreenResponse(status = TinkoffAcquiringDelegateOpenAttachScreenStatus.ERROR_NOT_INITIALIZED)
        )

        activityDelegate.runActivityForResult(
            { activity ->
                tinkoffAcquiring!!.openAttachCardScreen(
                    activity,
                    makeTinkoffAttachCardOptions(tinkoffCustomerOptions, tinkoffFeaturesOptions),
                    TINKOFF_ACQUIRING_OPEN_ATTACH_CARD_SCREEN_REQUEST
                )
            },
            TINKOFF_ACQUIRING_OPEN_ATTACH_CARD_SCREEN_REQUEST,
            { resultCode, data ->
                when (resultCode) {
                    Activity.RESULT_OK -> TinkoffAcquiringDelegateOpenAttachScreenResponse(
                        status = TinkoffAcquiringDelegateOpenAttachScreenStatus.RESULT_OK,
                        cardId = data.getStringExtra(TinkoffAcquiring.EXTRA_CARD_ID)
                    )
                    Activity.RESULT_CANCELED -> TinkoffAcquiringDelegateOpenAttachScreenResponse(
                        status = TinkoffAcquiringDelegateOpenAttachScreenStatus.RESULT_CANCELLED
                    )
                    TinkoffAcquiring.RESULT_ERROR -> TinkoffAcquiringDelegateOpenAttachScreenResponse(
                        status = TinkoffAcquiringDelegateOpenAttachScreenStatus.RESULT_ERROR,
                        error = data.getSerializableExtra(TinkoffAcquiring.EXTRA_ERROR) as Throwable
                    )
                    else -> TinkoffAcquiringDelegateOpenAttachScreenResponse(
                        status = TinkoffAcquiringDelegateOpenAttachScreenStatus.RESULT_NONE
                    )
                }
            }
        ) { res ->
            if (res == null) handler(TinkoffAcquiringDelegateOpenAttachScreenResponse(status = TinkoffAcquiringDelegateOpenAttachScreenStatus.ERROR_NO_ACTIVITY)) else handler(
                res
            )
        }
    }

    data class TinkoffAcquiringDelegateOpenPaymentScreenResponse(
        val status: TinkoffAcquiringDelegateOpenPaymentScreenStatus,
        val error: Throwable? = null,
        val cardId: String? = null,
        val paymentId: Long? = null
    )

    enum class TinkoffAcquiringDelegateOpenPaymentScreenStatus { RESULT_OK, RESULT_CANCELLED, RESULT_NONE, RESULT_ERROR, ERROR_NOT_INITIALIZED, ERROR_NO_ACTIVITY }

    fun openPaymentScreen(
        tinkoffOrderOptions: TinkoffOrderOptions,
        tinkoffCustomerOptions: TinkoffCustomerOptions,
        tinkoffFeaturesOptions: TinkoffFeaturesOptions,
        paymentState: AsdkState? = null,
        handler: (TinkoffAcquiringDelegateOpenPaymentScreenResponse) -> Unit
    ) {
        if (tinkoffAcquiring == null) return handler(
            TinkoffAcquiringDelegateOpenPaymentScreenResponse(status = TinkoffAcquiringDelegateOpenPaymentScreenStatus.ERROR_NOT_INITIALIZED)
        )

        activityDelegate.runActivityForResult(
            { activity ->
                tinkoffAcquiring!!.openPaymentScreen(
                    activity,
                    makeTinkoffPaymentOptions(
                        tinkoffOrderOptions,
                        tinkoffCustomerOptions,
                        tinkoffFeaturesOptions
                    ),
                    TINKOFF_ACQUIRING_OPEN_PAYMENT_SCREEN_REQUEST,
                    paymentState ?: DefaultState
                )
            },
            TINKOFF_ACQUIRING_OPEN_PAYMENT_SCREEN_REQUEST,
            { resultCode, data ->
                when (resultCode) {
                    Activity.RESULT_OK -> TinkoffAcquiringDelegateOpenPaymentScreenResponse(
                        status = TinkoffAcquiringDelegateOpenPaymentScreenStatus.RESULT_OK,
                        cardId = data.getStringExtra(TinkoffAcquiring.EXTRA_CARD_ID),
                        paymentId = data.getLongExtra(TinkoffAcquiring.EXTRA_PAYMENT_ID, -1)
                            .let { if (it != -1L) it else null }
                    )
                    Activity.RESULT_CANCELED -> TinkoffAcquiringDelegateOpenPaymentScreenResponse(
                        status = TinkoffAcquiringDelegateOpenPaymentScreenStatus.RESULT_CANCELLED
                    )
                    TinkoffAcquiring.RESULT_ERROR -> TinkoffAcquiringDelegateOpenPaymentScreenResponse(
                        status = TinkoffAcquiringDelegateOpenPaymentScreenStatus.RESULT_ERROR,
                        error = data.getSerializableExtra(TinkoffAcquiring.EXTRA_ERROR) as Throwable
                    )
                    else -> TinkoffAcquiringDelegateOpenPaymentScreenResponse(
                        status = TinkoffAcquiringDelegateOpenPaymentScreenStatus.RESULT_NONE
                    )
                }
            }
        ) { res ->
            if (res == null) handler(TinkoffAcquiringDelegateOpenPaymentScreenResponse(status = TinkoffAcquiringDelegateOpenPaymentScreenStatus.ERROR_NO_ACTIVITY)) else handler(
                res
            )
        }
    }

    data class TinkoffAcquiringDelegateOpenGooglePayResponse(
        val status: TinkoffAcquiringDelegateOpenGooglePayStatus,
        val error: Throwable? = null,
        val cardId: String? = null,
        val paymentId: Long? = null,
        val rebillId: String? = null,
        val paymentState: AsdkState? = null
    )

    enum class TinkoffAcquiringDelegateOpenGooglePayStatus { RESULT_OK, RESULT_CANCELLED, RESULT_REOPEN_UI, RESULT_ERROR, ERROR_NOT_INITIALIZED, ERROR_NO_ACTIVITY }

    fun openGooglePay(
        tinkoffOrderOptions: TinkoffOrderOptions,
        tinkoffCustomerOptions: TinkoffCustomerOptions,
        tinkoffFeaturesOptions: TinkoffFeaturesOptions,
        handler: (TinkoffAcquiringDelegateOpenGooglePayResponse) -> Unit
    ) {
        if (tinkoffAcquiring == null || googlePayHelper == null) {
            handler(
                TinkoffAcquiringDelegateOpenGooglePayResponse(status = TinkoffAcquiringDelegateOpenGooglePayStatus.ERROR_NOT_INITIALIZED)
            )
            return;
        }

        activityDelegate.runActivityForResult(
            { activity ->
                googlePayHelper!!.openGooglePay(
                    activity,
                    tinkoffOrderOptions.money,
                    TINKOFF_ACQUIRING_OPEN_GOOGLE_PAY_REQUEST
                )
            },
            TINKOFF_ACQUIRING_OPEN_GOOGLE_PAY_REQUEST,
            { resultCode, data ->
//                Logger.getLogger("LOG MY LOG").log(Level.WARNING, resultCode.toString())
                when (resultCode) {
                    Activity.RESULT_OK -> GooglePayHelper.getGooglePayToken(data)
                    Activity.RESULT_CANCELED -> "canceled"
                    else -> {
//                        AutoResolveHelper.getStatusFromIntent(data)?.let {
//                            Logger.getLogger("LOG MY LOG").log(Level.WARNING, it.toString())
//                        }
                        null
                    }
                }
            }
        ) { googlePayToken ->
//            Logger.getLogger("LOG MY LOG").log(Level.WARNING, googlePayToken.toString())
            when (googlePayToken) {
                null -> {
                    handler(
                        TinkoffAcquiringDelegateOpenGooglePayResponse(
                            status = TinkoffAcquiringDelegateOpenGooglePayStatus.ERROR_NO_ACTIVITY
                        )
                    )
                }
                "canceled" -> handler(
                    TinkoffAcquiringDelegateOpenGooglePayResponse(
                        status = TinkoffAcquiringDelegateOpenGooglePayStatus.RESULT_CANCELLED
                    )
                )
                else -> tinkoffAcquiring!!.initPayment(
                    googlePayToken!!,
                    makeTinkoffPaymentOptions(
                        tinkoffOrderOptions,
                        tinkoffCustomerOptions,
                        tinkoffFeaturesOptions
                    )
                )
                    .subscribe(object : PaymentListenerAdapter() {
                        override fun onSuccess(
                            paymentId: Long,
                            cardId: String?,
                            rebillId: String?
                        ) =
                            handler(
                                TinkoffAcquiringDelegateOpenGooglePayResponse(
                                    status = TinkoffAcquiringDelegateOpenGooglePayStatus.RESULT_OK,
                                    paymentId = paymentId,
                                    rebillId = rebillId,
                                    cardId = cardId
                                )
                            )

                        override fun onError(throwable: Throwable) =
                            handler(
                                TinkoffAcquiringDelegateOpenGooglePayResponse(
                                    status = TinkoffAcquiringDelegateOpenGooglePayStatus.RESULT_ERROR,
                                    error = throwable
                                )
                            )

                        override fun onUiNeeded(state: AsdkState) =
                            handler(
                                TinkoffAcquiringDelegateOpenGooglePayResponse(
                                    status = TinkoffAcquiringDelegateOpenGooglePayStatus.RESULT_REOPEN_UI,
                                    paymentState = state
                                )
                            )
                    })
                    .start()
            }
        }
    }

    data class TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(
        val status: TinkoffAcquiringDelegateOpenPaymentQrScreenStatus,
        val error: Throwable? = null
    )

    enum class TinkoffAcquiringDelegateOpenPaymentQrScreenStatus { RESULT_OK, RESULT_CANCELLED, RESULT_ERROR, RESULT_NONE, ERROR_NOT_INITIALIZED, ERROR_NO_ACTIVITY }

    fun openPaymentQrScreen(
        tinkoffFeaturesOptions: TinkoffFeaturesOptions,
        handler: (TinkoffAcquiringDelegateOpenPaymentQrScreenResponse) -> Unit
    ) {
        if (tinkoffAcquiring == null)
            return handler(
                TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(
                    status = TinkoffAcquiringDelegateOpenPaymentQrScreenStatus.ERROR_NOT_INITIALIZED
                )
            )


        activityDelegate.runActivityForResult(
            { activity ->
                tinkoffAcquiring!!.openStaticQrScreen(
                    activity,
                    tinkoffFeaturesOptions.toTinkoff(),
                    TINKOFF_ACQUIRING_OPEN_PAYMENT_QR_SCREEN_REQUEST
                )
            },
            TINKOFF_ACQUIRING_OPEN_PAYMENT_QR_SCREEN_REQUEST,
            { resultCode, data ->
                when (resultCode) {
                    Activity.RESULT_OK -> TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(
                        status = TinkoffAcquiringDelegateOpenPaymentQrScreenStatus.RESULT_OK
                    )
                    Activity.RESULT_CANCELED -> TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(
                        status = TinkoffAcquiringDelegateOpenPaymentQrScreenStatus.RESULT_CANCELLED
                    )
                    TinkoffAcquiring.RESULT_ERROR -> TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(
                        status = TinkoffAcquiringDelegateOpenPaymentQrScreenStatus.RESULT_ERROR,
                        error = data.getSerializableExtra(TinkoffAcquiring.EXTRA_ERROR) as Throwable
                    )
                    else -> TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(
                        status = TinkoffAcquiringDelegateOpenPaymentQrScreenStatus.RESULT_NONE
                    )
                }
            }
        ) { res ->
            if (res == null) handler(
                TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(
                    status = TinkoffAcquiringDelegateOpenPaymentQrScreenStatus.ERROR_NO_ACTIVITY
                )
            ) else handler(res)
        }

    }

    data class TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(
        val status: TinkoffAcquiringDelegateOpenSavedCardsScreenStatus,
        val error: Throwable? = null
    )

    enum class TinkoffAcquiringDelegateOpenSavedCardsScreenStatus { RESULT_OK, RESULT_CANCELLED, RESULT_ERROR, RESULT_NONE, ERROR_NOT_INITIALIZED, ERROR_NO_ACTIVITY }

    fun openSavedCardsScreen(
        tinkoffCustomerOptions: TinkoffCustomerOptions,
        tinkoffFeaturesOptions: TinkoffFeaturesOptions,
        handler: (TinkoffAcquiringDelegateOpenSavedCardsScreenResponse) -> Unit
    ) {
        if (tinkoffAcquiring == null)
            return handler(
                TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(
                    status = TinkoffAcquiringDelegateOpenSavedCardsScreenStatus.ERROR_NOT_INITIALIZED
                )
            )

        activityDelegate.runActivityForResult(
            { activity ->
                tinkoffAcquiring!!.openSavedCardsScreen(
                    activity,
                    makeTinkoffSavedCardsOptions(tinkoffCustomerOptions, tinkoffFeaturesOptions),
                    TINKOFF_ACQUIRING_OPEN_SAVED_CARDS_SCREEN_REQUEST
                )
            },
            TINKOFF_ACQUIRING_OPEN_SAVED_CARDS_SCREEN_REQUEST,
            { resultCode, data ->
                when (resultCode) {
                    Activity.RESULT_OK -> TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(
                        status = TinkoffAcquiringDelegateOpenSavedCardsScreenStatus.RESULT_OK
                    )
                    Activity.RESULT_CANCELED -> TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(
                        status = TinkoffAcquiringDelegateOpenSavedCardsScreenStatus.RESULT_CANCELLED
                    )
                    TinkoffAcquiring.RESULT_ERROR -> TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(
                        status = TinkoffAcquiringDelegateOpenSavedCardsScreenStatus.RESULT_ERROR,
                        error = data.getSerializableExtra(TinkoffAcquiring.EXTRA_ERROR) as Throwable
                    )
                    else -> TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(
                        status = TinkoffAcquiringDelegateOpenSavedCardsScreenStatus.RESULT_NONE
                    )
                }
            }
        ) { res ->
            if (res == null)
                handler(
                    TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(
                        status = TinkoffAcquiringDelegateOpenSavedCardsScreenStatus.ERROR_NO_ACTIVITY
                    )
                )
            else handler(res)
        }
    }

    companion object {
        private const val TINKOFF_ACQUIRING_OPEN_ATTACH_CARD_SCREEN_REQUEST = 0xf0ff + 1
        private const val TINKOFF_ACQUIRING_OPEN_PAYMENT_SCREEN_REQUEST = 0xf0ff + 2
        private const val TINKOFF_ACQUIRING_OPEN_GOOGLE_PAY_REQUEST = 0xf0ff + 3
        private const val TINKOFF_ACQUIRING_OPEN_PAYMENT_QR_SCREEN_REQUEST = 0xf0ff + 4
        private const val TINKOFF_ACQUIRING_OPEN_SAVED_CARDS_SCREEN_REQUEST = 0xf0ff + 5
    }
}
