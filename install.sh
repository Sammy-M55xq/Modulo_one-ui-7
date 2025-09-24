SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=false
LATESTARTSERVICE=false

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

# Set what you want to display when installing your module

print_modname() {
  ui_print "  "
  ui_print "  "
  ui_print "   🎮 Samsung-One-UI Optimization"
  ui_print "   by: @Samy_Snap (by.Build.@ericinacio🫶)"
  ui_print "  "                          
  ui_print "  "
  ui_print "   Aguarde as alterações vigentes..."
  sleep 3
  ui_print "   ✅ Spoof do Bootloader - Aplicado"
  sleep 3
  ui_print "   ✅ IOrapd desativado."
  sleep 2
  ui_print "   ✅ Build.prop configurado."
  sleep 1.5
  ui_print "."
  ui_print "."
  ui_print "."
  ui_print "."
  ui_print "   Reinicie seu dispositivo agora!💯" 
}

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "- Extraindo arquivos do módulo..."
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

ui_print "- Permissões dadas com êxito."
set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644
}