import Flutter
import UIKit
import TinkoffASDKUI
import TinkoffASDKCore

public var TINKOFF_COMMON_STATUS_FATAL_ERROR = "FATAL_ERROR"

public struct TinkoffOrderOptions {
  var orderId: String
  var money: NSNumber
  var title: String
  var description: String
  var recurrentPayment: Bool
    var shops: [Shop]
    var receipt: Receipt
}

public struct TinkoffCustomerOptions {
  var customerId: String
  var email: String?
}

public struct TinkoffFeaturesOptions {
  var language: String
}

public struct TinkoffApplePayOptions {
  var merchantIdentifier: String
  //TODO: Shipping contact,...
}

public class TinkoffAcquiringDelegate {
  private var registrar: FlutterPluginRegistrar
  private var viewController: UIViewController?

  private var acquiringSdk: AcquiringUISDK?

  init(registrar: FlutterPluginRegistrar, uiViewController: UIViewController?) {
    self.registrar = registrar
    self.viewController = uiViewController
  }

  public typealias TinkoffResult<T> = (T) -> Void

  private let viewConfigurationLanguageData: [String: [String: String]] = [ // Because fuck xcode localization and flutter integration, thats why
    "ru": [
      "text.totalAmount": "на сумму",
      "placeholder.email": "Отправить квитанцию по адресу"
    ],
    "en": [
      "text.totalAmount": "with amount",
      "placeholder.email": "Send receipt to email"
    ]
  ]
  private func initializeViewConfiguration(
    title: String,
    description: String,
    money: NSNumber,
    email: String?,
    enablePaySBP: Bool,
    emailRequired: Bool,
    language: String
  ) -> AcquiringViewConfiguration {
    let viewConfiguration = AcquiringViewConfiguration.init()
    viewConfiguration.fields = []
    viewConfiguration.viewTitle = title
    let title = NSAttributedString.init(string: title, attributes: [.font: UIFont.boldSystemFont(ofSize: 22)])
    let amountString = TinkoffAcquiringDelegate.formatAmount(NSDecimalNumber.init(decimal: money.decimalValue))
    let amountTitle = NSAttributedString.init(string: "\(viewConfigurationLanguageData[language]?["text.totalAmount"] ?? "") \(amountString)", attributes: [.font : UIFont.systemFont(ofSize: 17)])
    viewConfiguration.fields.append(AcquiringViewConfiguration.InfoFields.amount(title: title, amount: amountTitle))
    viewConfiguration.fields.append(AcquiringViewConfiguration.InfoFields.detail(title: NSAttributedString(string: description, attributes: [.font : UIFont.systemFont(ofSize: 17)])))

    if (emailRequired) {
        viewConfiguration.fields.append(AcquiringViewConfiguration.InfoFields.email(value: email, placeholder: viewConfigurationLanguageData[language]?["placeholder.email"] ?? ""))
    }
    if enablePaySBP { viewConfiguration.fields.append(AcquiringViewConfiguration.InfoFields.buttonPaySPB) }

    viewConfiguration.localizableInfo = AcquiringViewConfiguration.LocalizableInfo.init(lang: language)

    return viewConfiguration
  }

  public struct TinkoffAcquiringDelegateInitializeResponse {
    var status: TinkoffAcquiringDelegateInitializeStatus
    var error: Error? = nil
  }
  public enum TinkoffAcquiringDelegateInitializeStatus: String {
    case RESULT_OK = "RESULT_OK"
    case RESULT_ERROR = "RESULT_ERROR"
    case FLUTTER_NOT_INITIALIZED = "FLUTTER_NOT_INITIALIZED"
    case PLUGIN_ALREADY_INITIALIZED = "PLUGIN_ALREADY_INITIALIZED"
  }
  public func initialize(
    isDebug: Bool,
    isDeveloperMode: Bool,
    terminalKey: String,
    password: String,
    publicKey: String,
    result: @escaping TinkoffResult<TinkoffAcquiringDelegateInitializeResponse>
  ) {
    if self.viewController == nil { result(TinkoffAcquiringDelegateInitializeResponse(status: TinkoffAcquiringDelegateInitializeStatus.FLUTTER_NOT_INITIALIZED)) }
    if self.acquiringSdk != nil { result(TinkoffAcquiringDelegateInitializeResponse(status: TinkoffAcquiringDelegateInitializeStatus.PLUGIN_ALREADY_INITIALIZED)) }

    let acquiringEnvironment = isDeveloperMode ? AcquiringSdkEnvironment.test : AcquiringSdkEnvironment.prod
    
    do {
        let acquiringConfiguration = AcquiringSdkConfiguration(
            credential: AcquiringSdkCredential(terminalKey: terminalKey, publicKey: publicKey),
            server: acquiringEnvironment
          )
        
        acquiringConfiguration.logger = isDebug ? AcquiringLoggerDefault() : nil
      self.acquiringSdk = try AcquiringUISDK(configuration: acquiringConfiguration)

      result(TinkoffAcquiringDelegateInitializeResponse(status: TinkoffAcquiringDelegateInitializeStatus.RESULT_OK))
    }
    catch {
      result(TinkoffAcquiringDelegateInitializeResponse(
        status: TinkoffAcquiringDelegateInitializeStatus.RESULT_ERROR,
        error: error
      ))
    }
  }

  public struct TinkoffAcquiringDelegateOpenAttachCardScreenResponse {
    var status: TinkoffAcquiringDelegateOpenAttachCardScreenStatus
    var error: Error? = nil
    var cardId: String? = nil
  }
  public enum TinkoffAcquiringDelegateOpenAttachCardScreenStatus: String {
    case RESULT_OK = "RESULT_OK"
    case RESULT_ERROR = "RESULT_ERROR"
    case ERROR_NOT_INITIALIZED = "ERROR_NOT_INITIALIZED"
  }
  public func openAttachCardScreen(
    tinkoffCustomerOptions: TinkoffCustomerOptions,
    tinkoffFeaturesOptions: TinkoffFeaturesOptions,
    paymentCardCheckType: PaymentCardCheckType,
    result: @escaping TinkoffResult<TinkoffAcquiringDelegateOpenAttachCardScreenResponse>
  ) {
    if self.acquiringSdk == nil { result(TinkoffAcquiringDelegateOpenAttachCardScreenResponse(status: TinkoffAcquiringDelegateOpenAttachCardScreenStatus.ERROR_NOT_INITIALIZED)) }

    let viewConfiguration = AcquiringViewConfiguration()
    viewConfiguration.localizableInfo = AcquiringViewConfiguration.LocalizableInfo.init(lang: tinkoffFeaturesOptions.language)
    
    self.acquiringSdk?.addCardNeedSetCheckTypeHandler = {
        return paymentCardCheckType
    }
    
    self.acquiringSdk?.presentAddCardView(
      on: self.viewController!,
      customerKey: tinkoffCustomerOptions.customerId,
      configuration: viewConfiguration,
      completeHandler: { (apiResult: Result<PaymentCard?, Error>) -> Void in
        do {
          result(TinkoffAcquiringDelegateOpenAttachCardScreenResponse(
            status: TinkoffAcquiringDelegateOpenAttachCardScreenStatus.RESULT_OK,
            cardId: try apiResult.get()?.cardId
          ))
        }
        catch {
          result(TinkoffAcquiringDelegateOpenAttachCardScreenResponse(
            status: TinkoffAcquiringDelegateOpenAttachCardScreenStatus.RESULT_ERROR,
            error: error
          ))
        }
      }
    )
  }

  public struct TinkoffAcquiringDelegateOpenPaymentScreenResponse {
    var status: TinkoffAcquiringDelegateOpenPaymentScreenStatus
    var error: Error? = nil
    var cardId: String? = nil
    var paymentId: Int64? = nil
  }
  public enum TinkoffAcquiringDelegateOpenPaymentScreenStatus: String {
    case RESULT_OK = "RESULT_OK"
    case RESULT_ERROR = "RESULT_ERROR"
    case ERROR_NOT_INITIALIZED = "ERROR_NOT_INITIALIZED"
  }
  public func openPaymentScreen(
    tinkoffOrderOptions: TinkoffOrderOptions,
    tinkoffCustomerOptions: TinkoffCustomerOptions,
    tinkoffFeaturesOptions: TinkoffFeaturesOptions,
    emailRequired: Bool,
    result: @escaping TinkoffResult<TinkoffAcquiringDelegateOpenPaymentScreenResponse>
  ) {
    if self.acquiringSdk == nil { result(TinkoffAcquiringDelegateOpenPaymentScreenResponse(status: TinkoffAcquiringDelegateOpenPaymentScreenStatus.ERROR_NOT_INITIALIZED)) }

    var paymentData = PaymentInitData(
      amount: NSDecimalNumber(decimal: tinkoffOrderOptions.money.decimalValue),
      orderId: tinkoffOrderOptions.orderId,
      customerKey: tinkoffCustomerOptions.customerId
    )
    
    paymentData.shops = tinkoffOrderOptions.shops
    paymentData.receipt = tinkoffOrderOptions.receipt
    paymentData.savingAsParentPayment = tinkoffOrderOptions.recurrentPayment

    self.acquiringSdk?.presentPaymentView(
      on: self.viewController!,
      paymentData: paymentData,
      configuration: initializeViewConfiguration(
        title: tinkoffOrderOptions.title,
        description: tinkoffOrderOptions.description,
        money: tinkoffOrderOptions.money,
        email: tinkoffCustomerOptions.email,
        enablePaySBP: false,
        emailRequired: emailRequired,
        language: tinkoffFeaturesOptions.language
      ),
      completionHandler: { apiResult -> Void in
        do {
          let unfoldedResult = try apiResult.get()
          result(TinkoffAcquiringDelegateOpenPaymentScreenResponse(
            status: unfoldedResult.success ? TinkoffAcquiringDelegateOpenPaymentScreenStatus.RESULT_OK : TinkoffAcquiringDelegateOpenPaymentScreenStatus.RESULT_ERROR,
            paymentId: unfoldedResult.paymentId
          ))
        }
        catch {
          result(TinkoffAcquiringDelegateOpenPaymentScreenResponse(
            status: TinkoffAcquiringDelegateOpenPaymentScreenStatus.RESULT_ERROR,
            error: error
          ))
        }
      }
    )
  }

  public struct TinkoffAcquiringDelegateOpenApplePayResponse {
    var status: TinkoffAcquiringDelegateOpenApplePayStatus
    var error: Error? = nil
    var cardId: String? = nil
    var paymentId: Int64? = nil
  }
  public enum TinkoffAcquiringDelegateOpenApplePayStatus: String {
    case RESULT_OK = "RESULT_OK"
    case RESULT_ERROR = "RESULT_ERROR"
    case ERROR_NOT_INITIALIZED = "ERROR_NOT_INITIALIZED"
  }
  public func openApplePay(
    tinkoffOrderOptions: TinkoffOrderOptions,
    tinkoffCustomerOptions: TinkoffCustomerOptions,
    tinkoffFeaturesOptions: TinkoffFeaturesOptions,
    tinkoffApplePayOptions: TinkoffApplePayOptions,
    result: @escaping TinkoffResult<TinkoffAcquiringDelegateOpenApplePayResponse>
  ) {
    if self.acquiringSdk == nil { result(TinkoffAcquiringDelegateOpenApplePayResponse(status: TinkoffAcquiringDelegateOpenApplePayStatus.ERROR_NOT_INITIALIZED)) }

    var paymentData = PaymentInitData(
      amount: NSDecimalNumber(decimal: tinkoffOrderOptions.money.decimalValue),
      orderId: tinkoffOrderOptions.orderId,
      customerKey: tinkoffCustomerOptions.customerId
    )
    
    paymentData.shops = tinkoffOrderOptions.shops
    paymentData.receipt = tinkoffOrderOptions.receipt
    paymentData.savingAsParentPayment = tinkoffOrderOptions.recurrentPayment

    var applePayConfiguration = AcquiringUISDK.ApplePayConfiguration()
    applePayConfiguration.merchantIdentifier = tinkoffApplePayOptions.merchantIdentifier
    
    self.acquiringSdk?.presentPaymentApplePay(
      on: self.viewController!,
      paymentData: paymentData,
      viewConfiguration: initializeViewConfiguration(
        title: tinkoffOrderOptions.title,
        description: tinkoffOrderOptions.description,
        money: tinkoffOrderOptions.money,
        email: tinkoffCustomerOptions.email,
        enablePaySBP: false, emailRequired: false,
        language: tinkoffFeaturesOptions.language
      ),
      paymentConfiguration: applePayConfiguration,
      completionHandler: { (apiResult: Result<PaymentStatusResponse, Error>) -> Void in
        do {
          let unfoldedResult = try apiResult.get()
          result(TinkoffAcquiringDelegateOpenApplePayResponse(
            status: TinkoffAcquiringDelegateOpenApplePayStatus.RESULT_OK,
            paymentId: unfoldedResult.paymentId
          ))
        }
        catch {
          result(TinkoffAcquiringDelegateOpenApplePayResponse(
            status: TinkoffAcquiringDelegateOpenApplePayStatus.RESULT_ERROR,
            error: error
          ))
        }
      }
    )
  }
    
  public struct TinkoffAcquiringDelegateOpenSavedCardsScreenResponse {
    var status: TinkoffAcquiringDelegateOpenSavedCardsScreenStatus
    var error: Error? = nil
  }
  public enum TinkoffAcquiringDelegateOpenSavedCardsScreenStatus: String {
    case RESULT_OK = "RESULT_OK"
    case RESULT_ERROR = "RESULT_ERROR"
    case ERROR_NOT_INITIALIZED = "ERROR_NOT_INITIALIZED"
  }
  public func openSavedCardsScreen(
    tinkoffCustomerOptions: TinkoffCustomerOptions,
    tinkoffFeaturesOptions: TinkoffFeaturesOptions,
    result: @escaping TinkoffResult<TinkoffAcquiringDelegateOpenSavedCardsScreenResponse>
  ) {
    if self.acquiringSdk == nil { result(TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(status: TinkoffAcquiringDelegateOpenSavedCardsScreenStatus.ERROR_NOT_INITIALIZED)) }

    let viewConfiguration = AcquiringViewConfiguration()
    viewConfiguration.localizableInfo = AcquiringViewConfiguration.LocalizableInfo.init(lang: tinkoffFeaturesOptions.language)
    //presentPaymentQRCollector
    self.acquiringSdk?.presentCardList(
      on: self.viewController!,
      customerKey: tinkoffCustomerOptions.customerId,
      configuration: viewConfiguration
    )
    
    result(TinkoffAcquiringDelegateOpenSavedCardsScreenResponse(
      status: TinkoffAcquiringDelegateOpenSavedCardsScreenStatus.RESULT_OK
    ))
  }
  
  public struct TinkoffAcquiringDelegateOpenPaymentQrScreenResponse {
    var status: TinkoffAcquiringDelegateOpenPaymentQrScreenStatus
    var error: Error? = nil
  }
  public enum TinkoffAcquiringDelegateOpenPaymentQrScreenStatus: String {
    case RESULT_OK = "RESULT_OK"
    case RESULT_ERROR = "RESULT_ERROR"
    case ERROR_NOT_INITIALIZED = "ERROR_NOT_INITIALIZED"
  }
  public func openPaymentQrScreen(
    tinkoffFeaturesOptions: TinkoffFeaturesOptions,
    result: @escaping TinkoffResult<TinkoffAcquiringDelegateOpenPaymentQrScreenResponse>
  ) {
    if self.acquiringSdk == nil { result(TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(status: TinkoffAcquiringDelegateOpenPaymentQrScreenStatus.ERROR_NOT_INITIALIZED)) }

    let viewConfiguration = AcquiringViewConfiguration()
    viewConfiguration.localizableInfo = AcquiringViewConfiguration.LocalizableInfo.init(lang: tinkoffFeaturesOptions.language)
    
    self.acquiringSdk?.presentPaymentQRCollector(on: self.viewController!, configuration: viewConfiguration)
    
    result(TinkoffAcquiringDelegateOpenPaymentQrScreenResponse(
      status: TinkoffAcquiringDelegateOpenPaymentQrScreenStatus.RESULT_OK
    ))
  }
    
  private static let amountFormatter = NumberFormatter()
  private static func formatAmount(_ value: NSDecimalNumber, fractionDigits: Int = 2, currency: String = "₽") -> String {
    amountFormatter.usesGroupingSeparator = true
    amountFormatter.groupingSize = 3
    amountFormatter.groupingSeparator = " "
    amountFormatter.alwaysShowsDecimalSeparator = false
    amountFormatter.decimalSeparator = ","
    amountFormatter.minimumFractionDigits = 0
    amountFormatter.maximumFractionDigits = fractionDigits

    return "\(amountFormatter.string(from: value) ?? "\(value)") \(currency)"
  }
}


public class SwiftTinkoffAcquiringSdkPlugin: NSObject, FlutterPlugin {
  var delegate: TinkoffAcquiringDelegate
       
  init(pluginRegistrar: FlutterPluginRegistrar, uiViewController: UIViewController?) {
    delegate = TinkoffAcquiringDelegate(registrar: pluginRegistrar, uiViewController: uiViewController)
  }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "eu.nk2/tinkoff_acquiring_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftTinkoffAcquiringSdkPlugin(pluginRegistrar: registrar, uiViewController: UIApplication.shared.delegate?.window??.rootViewController)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let arguments = (call.arguments as? [String: Any]) else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "call.arguments are null", details: nil)); return }
    
    switch call.method {
    case "initialize":
        let isDebug: Bool = arguments["isDebug"] as? Bool ?? false
        let isDeveloperMode: Bool = arguments["isDeveloperMode"] as? Bool ?? false
      guard let terminalKey: String = arguments["terminalKey"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "terminalKey is required in initialize method", details: nil)); return }
      guard let password: String = arguments["password"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "password is required in initialize method", details: nil)); return }
      guard let publicKey: String = arguments["publicKey"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "publicKey is required in initialize method", details: nil)); return }

      delegate.initialize(
        isDebug: isDebug,
        isDeveloperMode: isDeveloperMode,
        terminalKey: terminalKey,
        password: password,
        publicKey: publicKey,
        result: { (response) -> Void in
          result([
            "status": response.status.rawValue,
            "error": (response.error as NSError?)?.description,
          ])
        }
      )
    case "openAttachCardScreen":
      guard let customerId: String = arguments["customerId"] as? String else {  result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "customerId is required in openAttachCardScreen method", details: nil)); return }
      let email: String? = arguments["email"] as? String
      guard let language: String = arguments["language"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "language is required in openAttachCardScreen method", details: nil)); return }
        let paymentCardCheckType = PaymentCardCheckType(rawValue: arguments["checkType"] as? String ?? "")

      delegate.openAttachCardScreen(
        tinkoffCustomerOptions: TinkoffCustomerOptions(customerId: customerId, email: email),
        tinkoffFeaturesOptions: TinkoffFeaturesOptions(language: language), paymentCardCheckType: paymentCardCheckType,
        result: { (response) -> Void in
          result([
            "status": response.status.rawValue,
            "error": (response.error as NSError?)?.description,
            "cardId": response.cardId
          ])
        }
      )

    case "openPaymentScreen":
      guard let customerId: String = arguments["customerId"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "customerId is required in openPaymentScreen method", details: nil)); return }
      let email: String? = arguments["email"] as? String
      guard let language: String = arguments["language"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "language is required in openPaymentScreen method", details: nil)); return }
      guard let orderId: String = arguments["orderId"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "orderId is required in openPaymentScreen method", details: nil)); return }
      guard let title: String = arguments["title"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "title is required in openPaymentScreen method", details: nil)); return }
      guard let description: String = arguments["description"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "description is required in openPaymentScreen method", details: nil)); return }
      guard let money: NSNumber = arguments["money"] as? NSNumber else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "money is required in openPaymentScreen method", details: nil)); return }
     let shops: [[String: Any]] = arguments["shops"] as? [[String: Any]] ?? []
      let receipt: [String: Any] = arguments["receipt"] as? [String: Any] ?? [:]
      let recurrentPayment: Bool = arguments["recurrentPayment"] as? Bool ?? false
        let emailRequired: Bool = arguments["emailRequired"] as? Bool ?? true

      delegate.openPaymentScreen(
        tinkoffOrderOptions: TinkoffOrderOptions(orderId: orderId, money: money, title: title, description: description, recurrentPayment: recurrentPayment, shops: mapShops(shops: shops), receipt: mapReciept(reciept: receipt)),
        tinkoffCustomerOptions: TinkoffCustomerOptions(customerId: customerId, email: email),
        tinkoffFeaturesOptions: TinkoffFeaturesOptions(language: language), emailRequired: emailRequired,
        result: { (response) -> Void in
          result([
            "status": response.status.rawValue,
            "error": (response.error as NSError?)?.description,
            "cardId": response.cardId as Any?,
            "paymentId": response.paymentId
          ])
        }
      )
    case "openApplePay":
      guard let customerId: String = arguments["customerId"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "customerId is required in openPaymentScreen method", details: nil)); return }
      let email: String? = arguments["email"] as? String
      guard let language: String = arguments["language"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "language is required in openPaymentScreen method", details: nil)); return }
      guard let orderId: String = arguments["orderId"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "orderId is required in openPaymentScreen method", details: nil)); return }
      guard let title: String = arguments["title"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "title is required in openPaymentScreen method", details: nil)); return }
      guard let description: String = arguments["description"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "description is required in openPaymentScreen method", details: nil)); return }
      guard let money: NSNumber = arguments["money"] as? NSNumber else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "money is required in openPaymentScreen method", details: nil)); return }
        guard let shops: [[String: Any]] = arguments["shops"] as? [[String: Any]] else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "shops is required in openPaymentScreen method", details: nil)); return }
        guard let receipt: [String: Any] = arguments["receipt"] as? [String: Any] else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "receipt is required in openPaymentScreen method", details: nil)); return }
      let recurrentPayment: Bool = arguments["recurrentPayment"] as? Bool ?? false
      guard let merchantIdentifier: String = arguments["merchantIdentifier"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "merchantIdentifier is required in openApplePay method", details: nil)); return }

      delegate.openApplePay(
        tinkoffOrderOptions: TinkoffOrderOptions(orderId: orderId, money: money, title: title, description: description, recurrentPayment: recurrentPayment, shops: mapShops(shops: shops), receipt: mapReciept(reciept: receipt)),
        tinkoffCustomerOptions: TinkoffCustomerOptions(customerId: customerId, email: email),
        tinkoffFeaturesOptions: TinkoffFeaturesOptions(language: language),
        tinkoffApplePayOptions: TinkoffApplePayOptions(merchantIdentifier: merchantIdentifier),
        result: { (response) -> Void in
          result([
            "status": response.status.rawValue,
            "error": (response.error as NSError?)?.description,
            "cardId": response.cardId as Any?,
            "paymentId": response.paymentId
          ])
        }
      )
    case "openSavedCardsScreen":
      guard let customerId: String = arguments["customerId"] as? String else {  result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "customerId is required in openSavedCardsScreen method", details: nil)); return }
      let email: String? = arguments["email"] as? String
      guard let language: String = arguments["language"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "language is required in openSavedCardsScreen method", details: nil)); return }

      delegate.openSavedCardsScreen(
        tinkoffCustomerOptions: TinkoffCustomerOptions(customerId: customerId, email: email),
        tinkoffFeaturesOptions: TinkoffFeaturesOptions(language: language),
        result: { (response) -> Void in
          result([
            "status": response.status.rawValue,
            "error": (response.error as NSError?)?.description
          ])
        }
      )
    case "openPaymentQrScreen":
      guard let language: String = arguments["language"] as? String else { result(FlutterError(code: TINKOFF_COMMON_STATUS_FATAL_ERROR, message: "language is required in openPaymentQrScreen method", details: nil)); return }

      delegate.openPaymentQrScreen(
        tinkoffFeaturesOptions: TinkoffFeaturesOptions(language: language),
        result: { (response) -> Void in
          result([
            "status": response.status.rawValue,
            "error": (response.error as NSError?)?.description
          ])
        }
      )
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    func mapShops(shops: [[String: Any]]) -> [Shop] {
        var array: [Shop] = []
        
        array = shops.map { (shop) -> Shop in
            let shopCode = shop["shopCode"] as? String
            let shopName = shop["shopName"] as? String
            let amount = shop["amount"] as? Int64
            let fee = shop["fee"] as? String
            return Shop(shopCode: shopCode, name: shopName, amount: amount, fee: fee)
        }
        
        return array
    }
    
    func mapReciept(reciept: [String: Any]) -> Receipt {
        let shopCode = reciept["shopCode"] as? String
        let email = reciept["email"] as? String
        let taxation = Taxation(rawValue: reciept["taxation"] as? String ?? "")
        let phone = reciept["phone"] as? String
        let items = mapItems(items: reciept["items"] as? [[String: Any]] ?? [[:]])
        let customer = reciept["customer"] as? String
        let customerInn = reciept["customerInn"] as? String
        return Receipt(shopCode: shopCode, email: email, taxation: taxation, phone: phone, items: items, agentData: nil, supplierInfo: nil, customer: customer, customerInn: customerInn)
    }
    
    func mapItems(items: [[String: Any]]) -> [Item] {
        var array: [Item] = []
        array = items.map({ (e) -> Item in
            return Item(
                amount: NSDecimalNumber(value: (e["amount"] as? Double ?? 0) / 100),
                price: NSDecimalNumber(value: (e["price"] as? Double ?? 0) / 100),
                name: e["name"] as? String ?? "",
                tax: Tax(rawValue: e["tax"] as? String ?? ""),
                quantity: e["quantity"] as? Double ?? 0.0,
                paymentObject: nil,
                paymentMethod: nil,
                ean13: nil,
                shopCode: nil,
                measurementUnit: nil,
                supplierInfo: nil,
                agentData: nil
            )
        })
        return array
    }
}
