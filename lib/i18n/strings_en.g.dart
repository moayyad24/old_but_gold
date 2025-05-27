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
	String get forget_password => 'Forget your password?';
	String get or => 'Or';
	String get continue_with_google => 'Continue with Google';
	String get email_example => 'Email@example.com';
	String get do_not_have_an_account => 'Don\'t have an account?';
	String get sign_up => 'Sign Up';
	String get agree_privacy_terms_and_politics => 'Agree Privacy terms & Politics';
	String get already_have_account => 'Already have an account?';
	String get repeat_password => 'Repeat Password';
	String get confirm_password => 'Confirm Password';
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
			case 'auth.forget_password': return 'Forget your password?';
			case 'auth.or': return 'Or';
			case 'auth.continue_with_google': return 'Continue with Google';
			case 'auth.email_example': return 'Email@example.com';
			case 'auth.do_not_have_an_account': return 'Don\'t have an account?';
			case 'auth.sign_up': return 'Sign Up';
			case 'auth.agree_privacy_terms_and_politics': return 'Agree Privacy terms & Politics';
			case 'auth.already_have_account': return 'Already have an account?';
			case 'auth.repeat_password': return 'Repeat Password';
			case 'auth.confirm_password': return 'Confirm Password';
			default: return null;
		}
	}
}

