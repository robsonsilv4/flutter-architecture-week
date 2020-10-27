package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import tech.robsonsilva.core_module.CoreModulePlugin;
import tech.robsonsilva.login_module.LoginModulePlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    CoreModulePlugin.registerWith(registry.registrarFor("tech.robsonsilva.core_module.CoreModulePlugin"));
    LoginModulePlugin.registerWith(registry.registrarFor("tech.robsonsilva.login_module.LoginModulePlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
