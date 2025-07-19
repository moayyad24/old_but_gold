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
	late final TranslationsFailuresEn failures = TranslationsFailuresEn._(_root);
	late final TranslationsValidatorEn validator = TranslationsValidatorEn._(_root);
	late final TranslationsOnboardingEn onboarding = TranslationsOnboardingEn._(_root);
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
	String get resend => 'Resend';
	String resendInSeconds({required Object remainingTime}) => 'Resend in ${remainingTime} seconds';
	String get pleaseAcceptOurPrivacyTermsAndPoliciesToContinue => 'Please accept our privacy terms and policies to continue.';
	String get resetPassword => 'Reset Password';
	String get createANewPasswordForYourAccount => 'Create a new password for your account';
	String get createNewPassword => 'Create New Password';
	String get checkCode => 'Check Code';
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

// Path: failures
class TranslationsFailuresEn {
	TranslationsFailuresEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get connectionTimeoutWithTheServer => 'Connection timeout with the server.';
	String get sendTimeoutOccurred => 'Send timeout occurred. Please try again.';
	String get receiveTimeout => 'Receive timeout. Server is taking too long to respond.';
	String get invalidServerCertificate => 'Invalid server certificate detected.';
	String get requestCanceled => 'Request was canceled.';
	String get connectionError => 'Connection error. Please check your internet.';
	String get noInternetConnection => 'No internet connection.';
	String get unexpectedError => 'Unexpected error occurred. Please try again.';
	String serverError({required Object statusCode}) => 'Server error ${statusCode}. Please try again later.';
	String get unexpectedResponse => 'Unexpected response from the server.';
}

// Path: validator
class TranslationsValidatorEn {
	TranslationsValidatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get thisFieldCannotBeEmpty => 'This field cannot be empty';
	String mustBeAtLeastCharacters({required Object minLength}) => 'Must be at least ${minLength} characters';
	String cannotExceedCharacters({required Object maxLength}) => 'Cannot exceed ${maxLength} characters';
	String get usernameCanOnlyContainLettersNumbersSpacesAndUnderscores => 'Username can only contain letters, numbers, spaces, and underscores';
	String get pleaseEnterAValidEmailAddress => 'Please enter a valid email address';
	String get passwordMustBeAtLeast8CharactersWithAtLeastOneLetterAndOneNumber => 'Password must be at least 8 characters with at least one letter and one number';
	String get pleaseEnterAValidPhoneNumber => 'Please enter a valid phone number';
}

// Path: onboarding
class TranslationsOnboardingEn {
	TranslationsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get getStarted => 'Get Started';
	String get lowestPricesEverInTheMarket => 'Lowest Prices Ever in the market';
	String get findBestDealsDescription => 'Find the best deals in the market, good value with the lowest prices ever';
	String get tailoredFeatures => 'Tailored Features just for you';
	String get tailoredRecommendationsDescription => 'Tailored recommendations catering you needs, with the option of selecting you preferences';
	String get buyAndGetPaidTitle => 'Buy your stuff , Get paid and more..';
	String get buyAndGetPaidDescription => 'Create a post, have clients, and buy your items with trusted users';
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
			case 'auth.resend': return 'Resend';
			case 'auth.resendInSeconds': return ({required Object remainingTime}) => 'Resend in ${remainingTime} seconds';
			case 'auth.pleaseAcceptOurPrivacyTermsAndPoliciesToContinue': return 'Please accept our privacy terms and policies to continue.';
			case 'auth.resetPassword': return 'Reset Password';
			case 'auth.createANewPasswordForYourAccount': return 'Create a new password for your account';
			case 'auth.createNewPassword': return 'Create New Password';
			case 'auth.checkCode': return 'Check Code';
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
			case 'failures.connectionTimeoutWithTheServer': return 'Connection timeout with the server.';
			case 'failures.sendTimeoutOccurred': return 'Send timeout occurred. Please try again.';
			case 'failures.receiveTimeout': return 'Receive timeout. Server is taking too long to respond.';
			case 'failures.invalidServerCertificate': return 'Invalid server certificate detected.';
			case 'failures.requestCanceled': return 'Request was canceled.';
			case 'failures.connectionError': return 'Connection error. Please check your internet.';
			case 'failures.noInternetConnection': return 'No internet connection.';
			case 'failures.unexpectedError': return 'Unexpected error occurred. Please try again.';
			case 'failures.serverError': return ({required Object statusCode}) => 'Server error ${statusCode}. Please try again later.';
			case 'failures.unexpectedResponse': return 'Unexpected response from the server.';
			case 'validator.thisFieldCannotBeEmpty': return 'This field cannot be empty';
			case 'validator.mustBeAtLeastCharacters': return ({required Object minLength}) => 'Must be at least ${minLength} characters';
			case 'validator.cannotExceedCharacters': return ({required Object maxLength}) => 'Cannot exceed ${maxLength} characters';
			case 'validator.usernameCanOnlyContainLettersNumbersSpacesAndUnderscores': return 'Username can only contain letters, numbers, spaces, and underscores';
			case 'validator.pleaseEnterAValidEmailAddress': return 'Please enter a valid email address';
			case 'validator.passwordMustBeAtLeast8CharactersWithAtLeastOneLetterAndOneNumber': return 'Password must be at least 8 characters with at least one letter and one number';
			case 'validator.pleaseEnterAValidPhoneNumber': return 'Please enter a valid phone number';
			case 'onboarding.getStarted': return 'Get Started';
			case 'onboarding.lowestPricesEverInTheMarket': return 'Lowest Prices Ever in the market';
			case 'onboarding.findBestDealsDescription': return 'Find the best deals in the market, good value with the lowest prices ever';
			case 'onboarding.tailoredFeatures': return 'Tailored Features just for you';
			case 'onboarding.tailoredRecommendationsDescription': return 'Tailored recommendations catering you needs, with the option of selecting you preferences';
			case 'onboarding.buyAndGetPaidTitle': return 'Buy your stuff , Get paid and more..';
			case 'onboarding.buyAndGetPaidDescription': return 'Create a post, have clients, and buy your items with trusted users';
			default: return null;
		}
	}
}

