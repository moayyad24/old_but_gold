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
	@override String get enter_your_password => 'أدخل كلمة المرور الخاصة بك';
	@override String get remember_me => 'تذكرني';
	@override String get forget_your_password => 'هل نسيت كلمة المرور؟';
	@override String get or => 'أو';
	@override String get continue_with_google => 'المتابعة باستخدام جوجل';
	@override String get email_example => 'أدخل البريد الإلكتروني الخاص بك';
	@override String get do_not_have_an_account => 'ليس لديك حساب؟';
	@override String get sign_up => 'إنشاء حساب';
	@override String get agree_privacy_terms_and_politics => 'الموافقة على الشروط والأحكام';
	@override String get already_have_account => 'لديك حساب بالفعل؟';
	@override String get repeat_password => 'أعد إدخال كلمة المرور';
	@override String get confirm_password => 'تأكيد كلمة المرور';
	@override String get forget_password => 'استعادة كلمة المرور';
	@override String get its_ok => 'لا بأس، هذا يحدث لأفضلنا، أدخل بريدك الإلكتروني';
	@override String get use_phone_instead => 'استخدم رقم الهاتف بدلاً من ذلك';
	@override String get we_may_use_your_email_address => 'قد نستخدم بريدك الإلكتروني لإرسال رسائل تتعلق بحسابك';
	@override String get recover_password => 'استرداد كلمة المرور';
	@override String get you_can_check_out_our => 'يمكنك الاطلاع على ';
	@override String get terms_of_service => 'شروط الخدمة';
	@override String get and_also => ' وأيضاً ';
	@override String get privacy_policy => 'سياسة الخصوصية';
	@override String get for_more_details => ' للمزيد من التفاصيل.';
	@override String get verify_code => 'تحقق من الرمز';
	@override String get four_digit_code => 'الرجاء إدخال الرمز المكون من 4 أرقام الذي أرسلناه إلى بريدك الإلكتروني';
	@override String get have_not_received_the_code => 'لم تستلم الرمز؟';
	@override String get verify => 'تحقق';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.skip': return 'تخطي';
			case 'auth.login': return 'تسجيل الدخول';
			case 'auth.email': return 'البريد الإلكتروني';
			case 'auth.password': return 'كلمة المرور';
			case 'auth.enter_your_password': return 'أدخل كلمة المرور الخاصة بك';
			case 'auth.remember_me': return 'تذكرني';
			case 'auth.forget_your_password': return 'هل نسيت كلمة المرور؟';
			case 'auth.or': return 'أو';
			case 'auth.continue_with_google': return 'المتابعة باستخدام جوجل';
			case 'auth.email_example': return 'أدخل البريد الإلكتروني الخاص بك';
			case 'auth.do_not_have_an_account': return 'ليس لديك حساب؟';
			case 'auth.sign_up': return 'إنشاء حساب';
			case 'auth.agree_privacy_terms_and_politics': return 'الموافقة على الشروط والأحكام';
			case 'auth.already_have_account': return 'لديك حساب بالفعل؟';
			case 'auth.repeat_password': return 'أعد إدخال كلمة المرور';
			case 'auth.confirm_password': return 'تأكيد كلمة المرور';
			case 'auth.forget_password': return 'استعادة كلمة المرور';
			case 'auth.its_ok': return 'لا بأس، هذا يحدث لأفضلنا، أدخل بريدك الإلكتروني';
			case 'auth.use_phone_instead': return 'استخدم رقم الهاتف بدلاً من ذلك';
			case 'auth.we_may_use_your_email_address': return 'قد نستخدم بريدك الإلكتروني لإرسال رسائل تتعلق بحسابك';
			case 'auth.recover_password': return 'استرداد كلمة المرور';
			case 'auth.you_can_check_out_our': return 'يمكنك الاطلاع على ';
			case 'auth.terms_of_service': return 'شروط الخدمة';
			case 'auth.and_also': return ' وأيضاً ';
			case 'auth.privacy_policy': return 'سياسة الخصوصية';
			case 'auth.for_more_details': return ' للمزيد من التفاصيل.';
			case 'auth.verify_code': return 'تحقق من الرمز';
			case 'auth.four_digit_code': return 'الرجاء إدخال الرمز المكون من 4 أرقام الذي أرسلناه إلى بريدك الإلكتروني';
			case 'auth.have_not_received_the_code': return 'لم تستلم الرمز؟';
			case 'auth.verify': return 'تحقق';
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
			default: return null;
		}
	}
}

