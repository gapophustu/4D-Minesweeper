extends WindowDialog

var _lang = ""
var _user_files = 0
var _import_game_path = ""
var _import_name = ""

func _ready():
	$ImportButton.disabled = true
	switch_locale()
	resize()
	add_to_group("translations")
	add_to_group("resizable")
	if global.first_start:
		popup_centered()

func switch_locale():
	window_title = TranslationServer.translate("SETTINGS_TITLE")
	$LanguageLabel.text = TranslationServer.translate("LANGUAGE")
	$LanguageOptionButton.hint_tooltip = TranslationServer.translate("LANGUAGE_TOOLTIP")
	$MarginLabel.text = TranslationServer.translate("MARGIN")
	$MarginLineEdit.hint_tooltip = TranslationServer.translate("MARGIN_TOOLTIP")
	$ScaleLabel.text = TranslationServer.translate("SCALE")
	$ScaleLineEdit.hint_tooltip = TranslationServer.translate("SCALE_TOOLTIP")
	$AutosaveLabel.text = TranslationServer.translate("AUTOSAVE")
	$AutosaveCheckBox.hint_tooltip = TranslationServer.translate("AUTOSAVE_TOOLTIP")
	$ExportButton.text = TranslationServer.translate("EXPORT")
	$ExportButton.hint_tooltip = TranslationServer.translate("EXPORT_TOOLTIP")
	$ImportButton.text = TranslationServer.translate("IMPORT")
	$ImportButton.hint_tooltip = TranslationServer.translate("IMPORT_TOOLTIP")
	$ImportOptionButton.hint_tooltip = TranslationServer.translate("IMPORT_NAME_TOOLTIP")
	$SaveButton.text = TranslationServer.translate("SAVE_SETTINGS")
	$SaveButton.hint_tooltip = TranslationServer.translate("SAVE_SETTINGS_TOOLTIP")
	_on_ExportLineEdit_text_changed()

func resize():
	var col2x = 0
	var sizey
	$LanguageLabel.get_font("font").size = 16 * global.scale
	$LanguageLabel.rect_position.x = global.margin * global.scale
	$LanguageLabel.rect_position.y = global.margin * global.scale
	$LanguageLabel.rect_size = Vector2(0, 0)
	col2x = max(col2x, $LanguageLabel.rect_size.x)
	$LanguageOptionButton.get_font("font").size = 12 * global.scale
	$LanguageOptionButton.rect_position.y = $LanguageLabel.rect_position.y
	$LanguageOptionButton.rect_size.x = 100 * global.scale
	$LanguageOptionButton.rect_size.y = 0
	sizey = max($LanguageLabel.rect_size.y, $LanguageOptionButton.rect_size.y)
	$LanguageLabel.rect_size.y = sizey
	$LanguageOptionButton.rect_size.y = sizey
	$MarginLabel.get_font("font").size = 16 * global.scale
	$MarginLabel.rect_position.x = $LanguageLabel.rect_position.x
	$MarginLabel.rect_position.y = $LanguageLabel.rect_position.y + $LanguageLabel.rect_size.y + global.margin * global.scale
	$MarginLabel.rect_size = Vector2(0, 0)
	col2x = max(col2x, $MarginLabel.rect_size.x)
	$MarginLineEdit.rect_position.y = $MarginLabel.rect_position.y
	$MarginLineEdit.text = $MarginLineEdit.text
	$MarginLineEdit.get_font("font").size = 11 * global.scale
	$MarginLineEdit.rect_size = Vector2($MarginLineEdit.get_font("font").get_string_size("99").x, 0)
	sizey = max($MarginLabel.rect_size.y, $MarginLineEdit.rect_size.y)
	$MarginLabel.rect_size.y = sizey
	$MarginLineEdit.rect_size.y = sizey
	$LanguageOptionButton.rect_size.y = $LanguageLabel.rect_size.y
	$ScaleLabel.get_font("font").size = 16 * global.scale
	$ScaleLabel.rect_position.x = $LanguageLabel.rect_position.x
	$ScaleLabel.rect_position.y = $MarginLabel.rect_position.y + $MarginLabel.rect_size.y + global.margin * global.scale
	$ScaleLabel.rect_size = Vector2(0, 0)
	col2x = max(col2x, $ScaleLabel.rect_size.x)
	$ScaleLineEdit.rect_position.y = $ScaleLabel.rect_position.y
	$ScaleLineEdit.text = $ScaleLineEdit.text
	$ScaleLineEdit.get_font("font").size = 11 * global.scale
	$ScaleLineEdit.rect_size = Vector2($ScaleLineEdit.get_font("font").get_string_size("3.33").x, 0)
	sizey = max($ScaleLabel.rect_size.y, $ScaleLineEdit.rect_size.y)
	$ScaleLabel.rect_size.y = sizey
	$ScaleLineEdit.rect_size.y = sizey
	$AutosaveLabel.rect_position.x = $LanguageLabel.rect_position.x
	$AutosaveLabel.rect_position.y = $ScaleLabel.rect_position.y + $ScaleLabel.rect_size.y + global.margin * global.scale
	$AutosaveLabel.rect_size = Vector2(0, 0)
	col2x = max(col2x, $AutosaveLabel.rect_size.x)
	$AutosaveCheckBox.rect_position.y = $AutosaveLabel.rect_position.y
	var checkbox_scale = $AutosaveLabel.rect_size.y / 24
	$AutosaveCheckBox.rect_scale = Vector2(checkbox_scale, checkbox_scale)
	$ExportButton.get_font("font").size = 12 * global.scale
	$ExportButton.rect_position.x = $LanguageLabel.rect_position.x
	$ExportButton.rect_position.y = $AutosaveLabel.rect_position.y + $AutosaveLabel.rect_size.y + global.margin * global.scale
	$ExportButton.rect_size = Vector2(0, 0)
	col2x = max(col2x, $ExportButton.rect_size.x)
	$ExportLineEdit.get_font("font").size = 11 * global.scale
	$ExportLineEdit.rect_position.y = $ExportButton.rect_position.y
	$ExportLineEdit.rect_size.x = 100 * global.scale
	$ExportLineEdit.rect_size.y = 0
	sizey = max($ExportButton.rect_size.y, $ExportLineEdit.rect_size.y)
	$ExportButton.rect_size.y = sizey
	$ExportLineEdit.rect_size.y = sizey
	$ImportButton.get_font("font").size = 12 * global.scale
	$ImportButton.rect_position.x = $LanguageLabel.rect_position.x
	$ImportButton.rect_position.y = $ExportButton.rect_position.y + $ExportButton.rect_size.y + global.margin * global.scale
	$ImportButton.rect_size = Vector2(0, 0)
	col2x = max(col2x, $ImportButton.rect_size.x)
	$ImportOptionButton.get_font("font").size = 12 * global.scale
	$ImportOptionButton.rect_position.y = $ImportButton.rect_position.y
	$ImportOptionButton.rect_size.x = 100 * global.scale
	$ImportOptionButton.rect_size.y = 0
	sizey = max($ImportButton.rect_size.y, $ImportOptionButton.rect_size.y)
	$ImportButton.rect_size.y = sizey
	$ImportOptionButton.rect_size.y = sizey
	rect_size.x = col2x + 100 * global.scale + 12 * global.margin * global.scale
	$LanguageOptionButton.rect_position.x = rect_size.x - $LanguageOptionButton.rect_size.x - global.margin * global.scale
	$MarginLineEdit.rect_position.x = rect_size.x - $MarginLineEdit.rect_size.x - global.margin * global.scale
	$ScaleLineEdit.rect_position.x = rect_size.x - $ScaleLineEdit.rect_size.x - global.margin * global.scale
	$AutosaveCheckBox.rect_position.x = rect_size.x - $AutosaveCheckBox.rect_size.x * checkbox_scale - global.margin * global.scale
	$ExportLineEdit.rect_position.x = rect_size.x - $ExportLineEdit.rect_size.x - global.margin * global.scale
	$ImportOptionButton.rect_position.x = rect_size.x - $ImportOptionButton.rect_size.x - global.margin * global.scale
	$SaveButton.get_font("font").size = 12 * global.scale
	$SaveButton.rect_size.y = 0
	$SaveButton.rect_position.x = $LanguageLabel.rect_position.x
	$SaveButton.rect_position.y = $ImportButton.rect_position.y + $ImportButton.rect_size.y + global.margin * global.scale
	$SaveButton.rect_size.x = rect_size.x - 2 * global.margin * global.scale
	
	
	rect_size.y = $SaveButton.rect_position.y + $SaveButton.rect_size.y + global.margin * global.scale

func update_ui():
	$LanguageOptionButton.clear()
	$LanguageOptionButton.add_item("Deutsch")
	$LanguageOptionButton.add_item("English")
	_lang = global.locale
	if global.locale == "de":
		$LanguageOptionButton.select(0)
	else:
		$LanguageOptionButton.select(1)
	$MarginLineEdit.text = str(global.margin)
	$ScaleLineEdit.text = str(global.scale)
	$AutosaveCheckBox.pressed = global.save_on_exit
	update_imports()

func _on_ExportButton_pressed():
	global.export_game($ExportLineEdit.text)

func _on_ExportLineEdit_text_changed(new_text = $ExportLineEdit.text):
	var files = []
	files = global.read_user_files()
	if files.has(new_text):
		$ExportLineEdit.add_color_override("font_color", Color(1, 0, 0))
		$ExportLineEdit.hint_tooltip = TranslationServer.translate("EXISTS")
		$ExportButton.add_color_override("font_color", Color(1, 0, 0))
		$ExportButton.add_color_override("font_color_hover", Color(1, 0, 0))
		$ExportButton.hint_tooltip = TranslationServer.translate("EXISTS")
	else:
		$ExportLineEdit.add_color_override("font_color", Color(1, 1, 1))
		$ExportLineEdit.hint_tooltip = TranslationServer.translate("EXPORT_NAME_TOOLTIP")
		$ExportButton.add_color_override("font_color", Color(1, 1, 1))
		$ExportButton.add_color_override("font_color_hover", Color(1, 1, 1))
		$ExportButton.hint_tooltip = TranslationServer.translate("EXPORT_TOOLTIP")
	if ! new_text == "" && ! new_text == "successes" && ! new_text == "save.sav" && ! new_text == "config.cfg" && ! "/" in new_text && ! "\\" in new_text && ! ":" in new_text && ! "*" in new_text && ! "\"" in new_text && ! "?" in new_text && ! "<" in new_text && ! ">" in new_text && ! "|" in new_text:
		$ExportButton.disabled = false
	else:
		$ExportButton.disabled = true

func _on_ImportButton_pressed():
	global.import_game(_import_game_path, _import_name)

func _on_SaveButton_pressed():
	global.locale = _lang
	global.margin = int($MarginLineEdit.text)
	global.scale = float($ScaleLineEdit.text)
	global.save_on_exit = $AutosaveCheckBox.pressed
	global.write_config()
	global.switch_locale()

func _on_LanguageOptionButton_item_selected(ID):
	if $LanguageOptionButton.get_item_text(ID) == "Deutsch":
		_lang = "de"
	elif $LanguageOptionButton.get_item_text(ID) == "English":
		_lang = "en"

func _on_ImportOptionButton_item_selected(ID):
	var selected = $ImportOptionButton.get_item_text(ID)
	if selected.find("<") > -1:
		selected = selected.left(selected.find("<") - 1)
	_import_name = selected
	if ID < _user_files:
		_import_game_path = "user://" + _import_name
		$ImportButton.disabled = false
	elif ID > _user_files || _user_files == 0:
		_import_game_path = global.exports + "exports/" + _import_name
		$ImportButton.disabled = false
	else:
		$ImportButton.disabled = true

func update_imports():
	$ImportOptionButton.clear()
	var files = []
	_user_files = 0
	var successes_file = File.new()
	var successes = {}
	if successes_file.open(global.successes_file_path, File.READ) == OK:
		successes = parse_json(successes_file.get_line())
	successes_file.close()
	files = global.read_user_files()
	for i in files:
		var loaddict = {}
		var savegame = File.new()
		if savegame.open("user://" + i, File.READ) == OK:
			loaddict = parse_json(savegame.get_line())
			if typeof(loaddict) == 18 && loaddict.has("size") && loaddict.has("mines_list") && loaddict.has("sphere"):
				_user_files += 1
				if successes.has(i):
					$ImportOptionButton.add_item(i + " <" + successes[i] + ">")
				else:
					$ImportOptionButton.add_item(i)
		savegame.close()
	if ! _user_files == 0:
		$ImportOptionButton.add_separator()
	files = global.read_game_files()
	for i in files:
		var loaddict = {}
		var savegame = File.new()
		if savegame.open(global.exports + "exports/" + i, File.READ) == OK:
			loaddict = parse_json(savegame.get_line())
			if loaddict.has("size") && loaddict.has("mines_list") && loaddict.has("sphere"):
				if successes.has(i):
					$ImportOptionButton.add_item(i + " <" + successes[i] + ">")
				else:
					$ImportOptionButton.add_item(i)
		savegame.close()
	if $ImportOptionButton.get_item_count() > 0:
		$ImportOptionButton.select(0)
		_on_ImportOptionButton_item_selected(0)
	resize()

func _on_Settings_item_rect_changed():
	rect_position.x = clamp(rect_position.x, 0, max(OS.window_size.x - rect_size.x, 0))
	rect_position.y = clamp(rect_position.y, 0, max(OS.window_size.y - rect_size.y, 0))
