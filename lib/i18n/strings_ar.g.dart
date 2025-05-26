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
	@override String get forget_password => 'نسيت كلمة المرور؟';
	@override String get or => 'أو';
	@override String get continue_with_google => 'المتابعة باستخدام جوجل';
	@override String get email_example => 'قم بإدخال البريد الإلكتروني الخاص بك';
	@override String get do_not_have_an_account => 'لا تمتلك حساب؟';
	@override String get sign_up => 'قم بإنشاء حساب';
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
			case 'auth.forget_password': return 'نسيت كلمة المرور؟';
			case 'auth.or': return 'أو';
			case 'auth.continue_with_google': return 'المتابعة باستخدام جوجل';
			case 'auth.email_example': return 'قم بإدخال البريد الإلكتروني الخاص بك';
			case 'auth.do_not_have_an_account': return 'لا تمتلك حساب؟';
			case 'auth.sign_up': return 'قم بإنشاء حساب';
			default: return null;
		}
	}
}

