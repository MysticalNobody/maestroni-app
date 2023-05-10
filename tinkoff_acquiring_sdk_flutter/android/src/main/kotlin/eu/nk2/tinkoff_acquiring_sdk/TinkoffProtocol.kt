package eu.nk2.tinkoff_acquiring_sdk

import io.flutter.plugin.common.MethodCall
import ru.tinkoff.acquiring.sdk.localization.AsdkSource
import ru.tinkoff.acquiring.sdk.localization.Language
import ru.tinkoff.acquiring.sdk.models.*
import ru.tinkoff.acquiring.sdk.models.enums.CheckType
import ru.tinkoff.acquiring.sdk.models.enums.Tax
import ru.tinkoff.acquiring.sdk.models.enums.Taxation
import ru.tinkoff.acquiring.sdk.models.options.CustomerOptions
import ru.tinkoff.acquiring.sdk.models.options.FeaturesOptions
import ru.tinkoff.acquiring.sdk.models.options.OrderOptions
import ru.tinkoff.acquiring.sdk.models.options.screen.AttachCardOptions
import ru.tinkoff.acquiring.sdk.models.options.screen.PaymentOptions
import ru.tinkoff.acquiring.sdk.models.options.screen.SavedCardsOptions
import ru.tinkoff.acquiring.sdk.utils.Money
import ru.tinkoff.cardio.CameraCardIOScanner

const val TINKOFF_COMMON_STATUS_FATAL_ERROR = "FATAL_ERROR"

data class TinkoffOrderOptions(
    val orderId: String,
    val money: Money,
    val title: String,
    val description: String,
    val recurrentPayment: Boolean,
    val shops: List<TinkoffShop>?,
    val receipt: TinkoffReceipt?
)

data class TinkoffShop(
    val shopCode: String? = null,
    val name: String? = null,
    val amount: Long? = 0,
    val fee: String? = null
)

data class TinkoffReceipt(
    val shopCode: String? = null,
    val email: String? = null,
    val taxation: String? = null,
    val phone: String? = null,
    val items: List<TinkoffItem>? = null
)

data class TinkoffItem(
    var price: Long = 0,
    var quantity: Double = 0.0,
    var name: String = "",
    var amount: Long = 0,
    var tax: Tax? = null
)

fun MethodCall.toTinkoffOrderOptions() = TinkoffOrderOptions(
    orderId = this.argument("orderId") ?: error("orderId is required in openPaymentScreen method"),
    title = this.argument("title") ?: error("title is required in openPaymentScreen method"),
    description = this.argument("description") ?: error("description is required in openPaymentScreen method"),
    money = Money.ofRubles(this.argument<Double>("money") ?: error("money is required in openPaymentScreen method")),
    recurrentPayment = this.argument("recurrentPayment") ?: false,
    shops = this.argument<List<Map<String, Any>>>("shops")?.map {
        TinkoffShop(
            it["shopCode"]?.toString(),
            it["name"]?.toString(),
            it["amount"]?.toString()?.toLong(),
            it["fee"]?.toString()
        )
    },
    receipt = this.argument<Map<String, Any?>>("receipt")?.toTinkoffReceipt()
)

fun Map<String, Any?>.toTinkoffReceipt(): TinkoffReceipt {
    return TinkoffReceipt(
        shopCode = this["shopCode"]?.toString(),
        email = this["email"]?.toString(),
        taxation = this["taxation"]?.toString(),
        phone = this["phone"]?.toString(),
        items = (this["items"] as? List<Map<String, Any>>)?.map {
            TinkoffItem(
                price = it["price"]?.toString()?.toLong() ?: error("item price is required in receipt method"),
                amount = it["amount"]?.toString()?.toLong() ?: error("amount price is required in receipt method"),
                quantity = it["quantity"]?.toString()?.toDouble() ?: error("quantity price is required in receipt method"),
                name = it["name"]?.toString() ?: error("name price is required in receipt method"),
                tax = if (it["tax"] != null) Tax.valueOf(it["tax"].toString()) else Tax.NONE
            )
        }
    )
}

fun TinkoffOrderOptions.toTinkoff(): OrderOptions {
    val options = OrderOptions()
    options.orderId = orderId
    options.amount = money
    options.title = title
    options.description = description
    options.recurrentPayment = recurrentPayment
//    options.shops = shops?.map { it.toTinkoff() }
//    options.receipt = receipt?.toTinkoff()

    return options
}

data class TinkoffCustomerOptions(
    val customerId: String,
    val checkType: CheckType,
    val email: String?
)

fun MethodCall.toTinkoffCustomerOptions() = TinkoffCustomerOptions(
    customerId = this.argument("customerId") ?: error("customerId is required in openPaymentScreen method"),
    checkType = this.argument<String>("checkType")?.let { CheckType.valueOf(it) } ?: CheckType.NO,
    email = this.argument("email")
)

fun TinkoffCustomerOptions.toTinkoff(): CustomerOptions {
    val options = CustomerOptions()
    options.customerKey = customerId
    options.checkType = checkType.toString()
    options.email = email

    return options
}

data class TinkoffFeaturesOptions(
    val enableSecureKeyboard: Boolean,
    val enableCameraCardScanner: Boolean,
    val darkThemeMode: DarkThemeMode,
    val language: Language,
    val emailRequired: Boolean
)

fun MethodCall.toTinkoffFeaturesOptions() = TinkoffFeaturesOptions(
    enableSecureKeyboard = this.argument("enableSecureKeyboard") ?: false,
    enableCameraCardScanner = this.argument("enableCameraCardScanner") ?: false,
    darkThemeMode = this.argument<String>("darkThemeMode")?.let { DarkThemeMode.valueOf(it) } ?: DarkThemeMode.AUTO,
    language = this.argument<String>("language")?.let { Language.valueOf(it) } ?: error("language is required in openPaymentScreen method"),
    emailRequired = this.argument("emailRequired") ?: false
)

fun TinkoffFeaturesOptions.toTinkoff(): FeaturesOptions {
    val options = FeaturesOptions()
    options.useSecureKeyboard = enableSecureKeyboard
    if(enableCameraCardScanner) options.cameraCardScanner = CameraCardIOScanner()
    options.darkThemeMode = darkThemeMode
    options.localizationSource = AsdkSource(language)
    options.emailRequired = emailRequired


    return options
}

fun TinkoffShop.toTinkoff(): Shop {
    return Shop(this.shopCode ?: "", this.name ?: "", this.amount ?: 0, this.fee)
}

fun TinkoffReceipt.toTinkoff(): Receipt {
    val itemsList = items?.map { it.toTinkoff() } ?: arrayListOf()
    val itemsArray = arrayListOf<Item>().apply { addAll(itemsList) }
    val tax = if (taxation != null) Taxation.valueOf(taxation) else Taxation.USN_INCOME_OUTCOME
    return Receipt().apply {
        this.shopCode = this@toTinkoff.shopCode
        this.phone = this@toTinkoff.phone
        this.email = this@toTinkoff.email
        this.taxation = tax
        this.items = itemsArray
    }
}

fun TinkoffItem.toTinkoff(): Item =
    Item(
        name = name,
        price = price,
        quantity = quantity,
        amount = amount,
        tax = tax
    )

fun makeTinkoffPaymentOptions(
    orderOptions: TinkoffOrderOptions,
    customerOptions: TinkoffCustomerOptions,
    featuresOptions: TinkoffFeaturesOptions,
    paymentState: AsdkState? = null
) = PaymentOptions().apply {
    order = orderOptions.toTinkoff()
    customer = customerOptions.toTinkoff()
    features = featuresOptions.toTinkoff()
    if(paymentState != null) asdkState = paymentState
}

fun makeTinkoffAttachCardOptions(
    customerOptions: TinkoffCustomerOptions,
    featuresOptions: TinkoffFeaturesOptions
) = AttachCardOptions().apply {
    customer = customerOptions.toTinkoff()
    features = featuresOptions.toTinkoff()
}

fun makeTinkoffSavedCardsOptions(
    customerOptions: TinkoffCustomerOptions,
    featuresOptions: TinkoffFeaturesOptions
) = SavedCardsOptions().apply {
    customer = customerOptions.toTinkoff()
    features = featuresOptions.toTinkoff()
}
