///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAuthAr auth = _TranslationsAuthAr._(_root);
	@override late final _TranslationsPersonalInfoAr personalInfo = _TranslationsPersonalInfoAr._(_root);
	@override late final _TranslationsFailuresAr failures = _TranslationsFailuresAr._(_root);
	@override late final _TranslationsValidatorAr validator = _TranslationsValidatorAr._(_root);
	@override late final _TranslationsOnboardingAr onboarding = _TranslationsOnboardingAr._(_root);
}

// Path: auth
class _TranslationsAuthAr implements TranslationsAuthEn {
	_TranslationsAuthAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get skip => 'تخطي';
	@override String get login => 'تسجيل الدخول';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get enterYourPassword => 'أدخل كلمة المرور الخاصة بك';
	@override String get rememberMe => 'تذكرني';
	@override String get forgetYourPassword => 'هل نسيت كلمة المرور؟';
	@override String get or => 'أو';
	@override String get continueWithGoogle => 'المتابعة باستخدام جوجل';
	@override String get emailExample => 'أدخل البريد الإلكتروني الخاص بك';
	@override String get doNotHaveAnAccount => 'ليس لديك حساب؟';
	@override String get signUp => 'إنشاء حساب';
	@override String get agreePrivacyTermsAndPolitics => 'الموافقة على الشروط والأحكام';
	@override String get alreadyHaveAccount => 'لديك حساب بالفعل؟';
	@override String get repeatPassword => 'أعد إدخال كلمة المرور';
	@override String get confirmPassword => 'تأكيد كلمة المرور';
	@override String get forgetPassword => 'استعادة كلمة المرور';
	@override String get itsOk => 'لا بأس، هذا يحدث لأفضلنا، أدخل بريدك الإلكتروني';
	@override String get usePhoneInstead => 'استخدم رقم الهاتف بدلاً من ذلك';
	@override String get weMayUseYourEmailAddress => 'قد نستخدم بريدك الإلكتروني لإرسال رسائل تتعلق بحسابك';
	@override String get recoverPassword => 'استرداد كلمة المرور';
	@override String get youCanCheckOutOur => 'يمكنك الاطلاع على ';
	@override String get termsOfService => 'شروط الخدمة';
	@override String get andAlso => ' وأيضاً ';
	@override String get privacyPolicy => 'سياسة الخصوصية';
	@override String get forMoreDetails => ' للمزيد من التفاصيل.';
	@override String get verifyCode => 'تحقق من الرمز';
	@override String get fourDigitCode => 'الرجاء إدخال الرمز المكون من 4 أرقام الذي أرسلناه إلى بريدك الإلكتروني';
	@override String get haveNotReceivedTheCode => 'لم تستلم الرمز؟';
	@override String get verify => 'تحقق';
	@override String get resend => 'إعادة الإرسال';
	@override String resendInSeconds({required Object remainingTime}) => 'إعادة الإرسال خلال ${remainingTime} ثانية';
	@override String get pleaseAcceptOurPrivacyTermsAndPoliciesToContinue => 'يرجى الموافقة على سياسة الخصوصية وشروط الخدمة';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get createANewPasswordForYourAccount => 'إنشاء كلمة مرور جديدة لحسابك';
	@override String get createNewPassword => 'إنشاء كلمة مرور جديدة';
	@override String get checkCode => 'تحقق من الرمز';
}

// Path: personalInfo
class _TranslationsPersonalInfoAr implements TranslationsPersonalInfoEn {
	_TranslationsPersonalInfoAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get personalInformation => 'المعلومات الشخصية';
	@override String get phoneNumber => 'رقم الهاتف';
	@override String get pleaseEnterPhoneNumber => 'يرجى إدخال رقم الهاتف';
	@override String get weMayUseYourPhoneNumber => 'قد نستخدم رقم هاتفك لإرسال رسائل تحتوي على معلومات حول حسابك';
	@override String get confirmYourInfo => 'تأكيد معلوماتك';
	@override String get chooseCountry => 'اختر الدولة';
	@override String get chooseCity => 'اختر المدينة';
	@override String get searchForCountryName => 'ابحث عن اسم الدولة..';
	@override String get searchForCityName => 'ابحث عن اسم المدينة..';
	@override String get confirmYourCountry => 'تأكيد دولتك';
	@override String get confirmYourCity => 'تأكيد مدينتك';
	@override String get chooseDateOfBirth => 'اختر تاريخ الميلاد';
	@override String get weMayUseYourDateOfBirth => 'قد نستخدم تاريخ ميلادك لتزويدك بتوصيات مخصصة لمن هم في فئتك العمرية';
	@override String get country => 'الدولة';
	@override String get city => 'المدينة';
	@override String get dateOfBirth => 'تاريخ الميلاد';
	@override String get required => 'مطلوب';
	@override String get firstName => 'الاسم الأول';
	@override String get lastName => 'الاسم الأخير';
}

// Path: failures
class _TranslationsFailuresAr implements TranslationsFailuresEn {
	_TranslationsFailuresAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get connectionTimeoutWithTheServer => 'انتهت مهلة الاتصال بالخادم.';
	@override String get sendTimeoutOccurred => 'انتهت مهلة الإرسال. يرجى المحاولة مرة أخرى.';
	@override String get receiveTimeout => 'انتهت مهلة الاستقبال. الخادم يستغرق وقتًا طويلاً للرد.';
	@override String get invalidServerCertificate => 'تم اكتشاف شهادة خادم غير صالحة.';
	@override String get requestCanceled => 'تم إلغاء الطلب.';
	@override String get connectionError => 'خطأ في الاتصال. يرجى التحقق من الإنترنت لديك.';
	@override String get noInternetConnection => 'لا يوجد اتصال بالإنترنت.';
	@override String get unexpectedError => 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
	@override String serverError({required Object statusCode}) => 'خطأ في الخادم ${statusCode}. يرجى المحاولة لاحقًا.';
	@override String get unexpectedResponse => 'استجابة غير متوقعة من الخادم.';
}

// Path: validator
class _TranslationsValidatorAr implements TranslationsValidatorEn {
	_TranslationsValidatorAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get thisFieldCannotBeEmpty => 'لا يمكن أن يكون هذا الحقل فارغًا';
	@override String mustBeAtLeastCharacters({required Object minLength}) => 'يجب أن يحتوي على ما لا يقل عن ${minLength} حرفًا';
	@override String cannotExceedCharacters({required Object maxLength}) => 'لا يمكن أن يتجاوز ${maxLength} حرفًا';
	@override String get usernameCanOnlyContainLettersNumbersSpacesAndUnderscores => 'يمكن لاسم المستخدم أن يحتوي فقط على حروف وأرقام ومسافات وشرطات سفلية';
	@override String get pleaseEnterAValidEmailAddress => 'يرجى إدخال عنوان بريد إلكتروني صالح';
	@override String get passwordMustBeAtLeast8CharactersWithAtLeastOneLetterAndOneNumber => 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل وتحتوي على حرف واحد ورقم واحد على الأقل';
	@override String get pleaseEnterAValidPhoneNumber => 'يرجى إدخال رقم هاتف صالح';
}

// Path: onboarding
class _TranslationsOnboardingAr implements TranslationsOnboardingEn {
	_TranslationsOnboardingAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get getStarted => 'ابدأ الآن';
	@override String get lowestPricesEverInTheMarket => 'أقل الأسعار في السوق على الإطلاق';
	@override String get findBestDealsDescription => 'ابحث عن أفضل العروض في السوق، قيمة ممتازة بأقل الأسعار على الإطلاق';
	@override String get tailoredFeatures => 'ميزات مصممة خصيصًا لك';
	@override String get tailoredRecommendationsDescription => 'توصيات مخصصة تلبي احتياجاتك مع خيار تحديد تفضيلاتك الشخصية';
	@override String get buyAndGetPaidTitle => 'اشترِ منتجاتك، احصل على أمولك والمزيد..';
	@override String get buyAndGetPaidDescription => 'أنشئ منشورًا، اجذب العملاء، وقم بشراء وبيع المنتجات مع مستخدمين موثوق بهم';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.skip': return 'تخطي';
			case 'auth.login': return 'تسجيل الدخول';
			case 'auth.email': return 'البريد الإلكتروني';
			case 'auth.password': return 'كلمة المرور';
			case 'auth.enterYourPassword': return 'أدخل كلمة المرور الخاصة بك';
			case 'auth.rememberMe': return 'تذكرني';
			case 'auth.forgetYourPassword': return 'هل نسيت كلمة المرور؟';
			case 'auth.or': return 'أو';
			case 'auth.continueWithGoogle': return 'المتابعة باستخدام جوجل';
			case 'auth.emailExample': return 'أدخل البريد الإلكتروني الخاص بك';
			case 'auth.doNotHaveAnAccount': return 'ليس لديك حساب؟';
			case 'auth.signUp': return 'إنشاء حساب';
			case 'auth.agreePrivacyTermsAndPolitics': return 'الموافقة على الشروط والأحكام';
			case 'auth.alreadyHaveAccount': return 'لديك حساب بالفعل؟';
			case 'auth.repeatPassword': return 'أعد إدخال كلمة المرور';
			case 'auth.confirmPassword': return 'تأكيد كلمة المرور';
			case 'auth.forgetPassword': return 'استعادة كلمة المرور';
			case 'auth.itsOk': return 'لا بأس، هذا يحدث لأفضلنا، أدخل بريدك الإلكتروني';
			case 'auth.usePhoneInstead': return 'استخدم رقم الهاتف بدلاً من ذلك';
			case 'auth.weMayUseYourEmailAddress': return 'قد نستخدم بريدك الإلكتروني لإرسال رسائل تتعلق بحسابك';
			case 'auth.recoverPassword': return 'استرداد كلمة المرور';
			case 'auth.youCanCheckOutOur': return 'يمكنك الاطلاع على ';
			case 'auth.termsOfService': return 'شروط الخدمة';
			case 'auth.andAlso': return ' وأيضاً ';
			case 'auth.privacyPolicy': return 'سياسة الخصوصية';
			case 'auth.forMoreDetails': return ' للمزيد من التفاصيل.';
			case 'auth.verifyCode': return 'تحقق من الرمز';
			case 'auth.fourDigitCode': return 'الرجاء إدخال الرمز المكون من 4 أرقام الذي أرسلناه إلى بريدك الإلكتروني';
			case 'auth.haveNotReceivedTheCode': return 'لم تستلم الرمز؟';
			case 'auth.verify': return 'تحقق';
			case 'auth.resend': return 'إعادة الإرسال';
			case 'auth.resendInSeconds': return ({required Object remainingTime}) => 'إعادة الإرسال خلال ${remainingTime} ثانية';
			case 'auth.pleaseAcceptOurPrivacyTermsAndPoliciesToContinue': return 'يرجى الموافقة على سياسة الخصوصية وشروط الخدمة';
			case 'auth.resetPassword': return 'إعادة تعيين كلمة المرور';
			case 'auth.createANewPasswordForYourAccount': return 'إنشاء كلمة مرور جديدة لحسابك';
			case 'auth.createNewPassword': return 'إنشاء كلمة مرور جديدة';
			case 'auth.checkCode': return 'تحقق من الرمز';
			case 'personalInfo.personalInformation': return 'المعلومات الشخصية';
			case 'personalInfo.phoneNumber': return 'رقم الهاتف';
			case 'personalInfo.pleaseEnterPhoneNumber': return 'يرجى إدخال رقم الهاتف';
			case 'personalInfo.weMayUseYourPhoneNumber': return 'قد نستخدم رقم هاتفك لإرسال رسائل تحتوي على معلومات حول حسابك';
			case 'personalInfo.confirmYourInfo': return 'تأكيد معلوماتك';
			case 'personalInfo.chooseCountry': return 'اختر الدولة';
			case 'personalInfo.chooseCity': return 'اختر المدينة';
			case 'personalInfo.searchForCountryName': return 'ابحث عن اسم الدولة..';
			case 'personalInfo.searchForCityName': return 'ابحث عن اسم المدينة..';
			case 'personalInfo.confirmYourCountry': return 'تأكيد دولتك';
			case 'personalInfo.confirmYourCity': return 'تأكيد مدينتك';
			case 'personalInfo.chooseDateOfBirth': return 'اختر تاريخ الميلاد';
			case 'personalInfo.weMayUseYourDateOfBirth': return 'قد نستخدم تاريخ ميلادك لتزويدك بتوصيات مخصصة لمن هم في فئتك العمرية';
			case 'personalInfo.country': return 'الدولة';
			case 'personalInfo.city': return 'المدينة';
			case 'personalInfo.dateOfBirth': return 'تاريخ الميلاد';
			case 'personalInfo.required': return 'مطلوب';
			case 'personalInfo.firstName': return 'الاسم الأول';
			case 'personalInfo.lastName': return 'الاسم الأخير';
			case 'failures.connectionTimeoutWithTheServer': return 'انتهت مهلة الاتصال بالخادم.';
			case 'failures.sendTimeoutOccurred': return 'انتهت مهلة الإرسال. يرجى المحاولة مرة أخرى.';
			case 'failures.receiveTimeout': return 'انتهت مهلة الاستقبال. الخادم يستغرق وقتًا طويلاً للرد.';
			case 'failures.invalidServerCertificate': return 'تم اكتشاف شهادة خادم غير صالحة.';
			case 'failures.requestCanceled': return 'تم إلغاء الطلب.';
			case 'failures.connectionError': return 'خطأ في الاتصال. يرجى التحقق من الإنترنت لديك.';
			case 'failures.noInternetConnection': return 'لا يوجد اتصال بالإنترنت.';
			case 'failures.unexpectedError': return 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
			case 'failures.serverError': return ({required Object statusCode}) => 'خطأ في الخادم ${statusCode}. يرجى المحاولة لاحقًا.';
			case 'failures.unexpectedResponse': return 'استجابة غير متوقعة من الخادم.';
			case 'validator.thisFieldCannotBeEmpty': return 'لا يمكن أن يكون هذا الحقل فارغًا';
			case 'validator.mustBeAtLeastCharacters': return ({required Object minLength}) => 'يجب أن يحتوي على ما لا يقل عن ${minLength} حرفًا';
			case 'validator.cannotExceedCharacters': return ({required Object maxLength}) => 'لا يمكن أن يتجاوز ${maxLength} حرفًا';
			case 'validator.usernameCanOnlyContainLettersNumbersSpacesAndUnderscores': return 'يمكن لاسم المستخدم أن يحتوي فقط على حروف وأرقام ومسافات وشرطات سفلية';
			case 'validator.pleaseEnterAValidEmailAddress': return 'يرجى إدخال عنوان بريد إلكتروني صالح';
			case 'validator.passwordMustBeAtLeast8CharactersWithAtLeastOneLetterAndOneNumber': return 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل وتحتوي على حرف واحد ورقم واحد على الأقل';
			case 'validator.pleaseEnterAValidPhoneNumber': return 'يرجى إدخال رقم هاتف صالح';
			case 'onboarding.getStarted': return 'ابدأ الآن';
			case 'onboarding.lowestPricesEverInTheMarket': return 'أقل الأسعار في السوق على الإطلاق';
			case 'onboarding.findBestDealsDescription': return 'ابحث عن أفضل العروض في السوق، قيمة ممتازة بأقل الأسعار على الإطلاق';
			case 'onboarding.tailoredFeatures': return 'ميزات مصممة خصيصًا لك';
			case 'onboarding.tailoredRecommendationsDescription': return 'توصيات مخصصة تلبي احتياجاتك مع خيار تحديد تفضيلاتك الشخصية';
			case 'onboarding.buyAndGetPaidTitle': return 'اشترِ منتجاتك، احصل على أمولك والمزيد..';
			case 'onboarding.buyAndGetPaidDescription': return 'أنشئ منشورًا، اجذب العملاء، وقم بشراء وبيع المنتجات مع مستخدمين موثوق بهم';
			default: return null;
		}
	}
}

