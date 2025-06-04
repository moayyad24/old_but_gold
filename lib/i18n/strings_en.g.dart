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
	String get enterYourPassword => 'Enter Your Password';
	String get rememberMe => 'Remember me';
	String get forgetYourPassword => 'Forget your password?';
	String get or => 'Or';
	String get continueWithGoogle => 'Continue with Google';
	String get emailExample => 'Email@example.com';
	String get doNotHaveAnAccount => 'Don\'t have an account?';
	String get signUp => 'Sign Up';
	String get agreePrivacyTermsAndPolitics => 'Agree Privacy terms & Politics';
	String get alreadyHaveAccount => 'Already have an account?';
	String get repeatPassword => 'Repeat Password';
	String get confirmPassword => 'Confirm Password';
	String get forgetPassword => 'Forget Password';
	String get itsOk => 'It’s ok, it happens to the best of us, enter your address email';
	String get usePhoneInstead => 'Use phone instead';
	String get weMayUseYourEmailAddress => 'We may use your email address to send you messages with information regarding your account';
	String get recoverPassword => 'Recover Password';
	String get youCanCheckOutOur => 'You can check out our ';
	String get termsOfService => 'Terms of Service';
	String get andAlso => ' and also ';
	String get privacyPolicy => 'Privacy Policy';
	String get forMoreDetails => ', for more details.';
	String get verifyCode => 'Verify Code';
	String get fourDigitCode => 'Please enter the 4-digit code we’ve sent to you email';
	String get haveNotReceivedTheCode => 'Haven’t received the code?';
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
			case 'auth.enterYourPassword': return 'Enter Your Password';
			case 'auth.rememberMe': return 'Remember me';
			case 'auth.forgetYourPassword': return 'Forget your password?';
			case 'auth.or': return 'Or';
			case 'auth.continueWithGoogle': return 'Continue with Google';
			case 'auth.emailExample': return 'Email@example.com';
			case 'auth.doNotHaveAnAccount': return 'Don\'t have an account?';
			case 'auth.signUp': return 'Sign Up';
			case 'auth.agreePrivacyTermsAndPolitics': return 'Agree Privacy terms & Politics';
			case 'auth.alreadyHaveAccount': return 'Already have an account?';
			case 'auth.repeatPassword': return 'Repeat Password';
			case 'auth.confirmPassword': return 'Confirm Password';
			case 'auth.forgetPassword': return 'Forget Password';
			case 'auth.itsOk': return 'It’s ok, it happens to the best of us, enter your address email';
			case 'auth.usePhoneInstead': return 'Use phone instead';
			case 'auth.weMayUseYourEmailAddress': return 'We may use your email address to send you messages with information regarding your account';
			case 'auth.recoverPassword': return 'Recover Password';
			case 'auth.youCanCheckOutOur': return 'You can check out our ';
			case 'auth.termsOfService': return 'Terms of Service';
			case 'auth.andAlso': return ' and also ';
			case 'auth.privacyPolicy': return 'Privacy Policy';
			case 'auth.forMoreDetails': return ', for more details.';
			case 'auth.verifyCode': return 'Verify Code';
			case 'auth.fourDigitCode': return 'Please enter the 4-digit code we’ve sent to you email';
			case 'auth.haveNotReceivedTheCode': return 'Haven’t received the code?';
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

