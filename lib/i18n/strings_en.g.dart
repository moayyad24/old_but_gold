///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsPersonalInfoEn personalInfo = TranslationsPersonalInfoEn._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get skip => 'Skip';
	String get login => 'Login';
	String get email => 'Email';
	String get password => 'Password';
	String get enter_your_password => 'Enter Your Password';
	String get remember_me => 'Remember me';
	String get forget_your_password => 'Forget your password?';
	String get or => 'Or';
	String get continue_with_google => 'Continue with Google';
	String get email_example => 'Email@example.com';
	String get do_not_have_an_account => 'Don\'t have an account?';
	String get sign_up => 'Sign Up';
	String get agree_privacy_terms_and_politics => 'Agree Privacy terms & Politics';
	String get already_have_account => 'Already have an account?';
	String get repeat_password => 'Repeat Password';
	String get confirm_password => 'Confirm Password';
	String get forget_password => 'Forget Password';
	String get its_ok => 'It’s ok, it happens to the best of us, enter your address email';
	String get use_phone_instead => 'Use phone instead';
	String get we_may_use_your_email_address => 'We may use your email address to send you messages with information regarding your account';
	String get recover_password => 'Recover Password';
	String get you_can_check_out_our  => 'You can check out our ';
	String get terms_of_service => 'Terms of Service';
	String get and_also => ' and also ';
	String get privacy_policy => 'Privacy Policy';
	String get for_more_details => ', for more details.';
	String get verify_code => 'Verify Code';
	String get four_digit_code => 'Please enter the 4-digit code we’ve sent to you email';
	String get have_not_received_the_code => 'Haven’t received the code?';
	String get verify => 'Verify';
}

// Path: personalInfo
class TranslationsPersonalInfoEn {
	TranslationsPersonalInfoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get personalInformation => 'Personal Information';
	String get phoneNumber => 'Phone Number';
	String get pleaseEnterPhoneNumber => 'Please enter phone number';
	String get weMayUseYourPhoneNumber => 'We may use your phone number to send you messages with information regarding your account';
	String get confirmYourInfo => 'Confirm Your Info';
	String get chooseCountry => 'Choose Country';
	String get chooseCity => 'Choose City';
	String get searchForCountryName => 'Search for country name..';
	String get searchForCityName => 'Search for city name..';
	String get confirmYourCountry => 'Confirm Your Country';
	String get confirmYourCity => 'Confirm Your City';
	String get chooseDateOfBirth => 'Choose Date of Birth';
	String get weMayUseYourDateOfBirth => 'We may use your date of birth to give you tailored recommendations to whom they are in your age';
	String get country => 'Country';
	String get city => 'City';
	String get dateOfBirth => 'Date of Birth';
	String get required => 'Required';
	String get firstName => 'First Name';
	String get lastName => 'Last Name';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.skip': return 'Skip';
			case 'auth.login': return 'Login';
			case 'auth.email': return 'Email';
			case 'auth.password': return 'Password';
			case 'auth.enter_your_password': return 'Enter Your Password';
			case 'auth.remember_me': return 'Remember me';
			case 'auth.forget_your_password': return 'Forget your password?';
			case 'auth.or': return 'Or';
			case 'auth.continue_with_google': return 'Continue with Google';
			case 'auth.email_example': return 'Email@example.com';
			case 'auth.do_not_have_an_account': return 'Don\'t have an account?';
			case 'auth.sign_up': return 'Sign Up';
			case 'auth.agree_privacy_terms_and_politics': return 'Agree Privacy terms & Politics';
			case 'auth.already_have_account': return 'Already have an account?';
			case 'auth.repeat_password': return 'Repeat Password';
			case 'auth.confirm_password': return 'Confirm Password';
			case 'auth.forget_password': return 'Forget Password';
			case 'auth.its_ok': return 'It’s ok, it happens to the best of us, enter your address email';
			case 'auth.use_phone_instead': return 'Use phone instead';
			case 'auth.we_may_use_your_email_address': return 'We may use your email address to send you messages with information regarding your account';
			case 'auth.recover_password': return 'Recover Password';
			case 'auth.you_can_check_out_our ': return 'You can check out our ';
			case 'auth.terms_of_service': return 'Terms of Service';
			case 'auth.and_also': return ' and also ';
			case 'auth.privacy_policy': return 'Privacy Policy';
			case 'auth.for_more_details': return ', for more details.';
			case 'auth.verify_code': return 'Verify Code';
			case 'auth.four_digit_code': return 'Please enter the 4-digit code we’ve sent to you email';
			case 'auth.have_not_received_the_code': return 'Haven’t received the code?';
			case 'auth.verify': return 'Verify';
			case 'personalInfo.personalInformation': return 'Personal Information';
			case 'personalInfo.phoneNumber': return 'Phone Number';
			case 'personalInfo.pleaseEnterPhoneNumber': return 'Please enter phone number';
			case 'personalInfo.weMayUseYourPhoneNumber': return 'We may use your phone number to send you messages with information regarding your account';
			case 'personalInfo.confirmYourInfo': return 'Confirm Your Info';
			case 'personalInfo.chooseCountry': return 'Choose Country';
			case 'personalInfo.chooseCity': return 'Choose City';
			case 'personalInfo.searchForCountryName': return 'Search for country name..';
			case 'personalInfo.searchForCityName': return 'Search for city name..';
			case 'personalInfo.confirmYourCountry': return 'Confirm Your Country';
			case 'personalInfo.confirmYourCity': return 'Confirm Your City';
			case 'personalInfo.chooseDateOfBirth': return 'Choose Date of Birth';
			case 'personalInfo.weMayUseYourDateOfBirth': return 'We may use your date of birth to give you tailored recommendations to whom they are in your age';
			case 'personalInfo.country': return 'Country';
			case 'personalInfo.city': return 'City';
			case 'personalInfo.dateOfBirth': return 'Date of Birth';
			case 'personalInfo.required': return 'Required';
			case 'personalInfo.firstName': return 'First Name';
			case 'personalInfo.lastName': return 'Last Name';
			default: return null;
		}
	}
}

