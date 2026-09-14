///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$core$en core = Translations$core$en.internal(_root);
	late final Translations$common$en common = Translations$common$en.internal(_root);
	late final Translations$flightdeck$en flightdeck = Translations$flightdeck$en.internal(_root);
	late final Translations$settings$en settings = Translations$settings$en.internal(_root);
	late final Translations$automation$en automation = Translations$automation$en.internal(_root);
	late final Translations$fileOperation$en fileOperation = Translations$fileOperation$en.internal(_root);
	late final Translations$theme$en theme = Translations$theme$en.internal(_root);
}

// Path: core
class Translations$core$en {
	Translations$core$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$core$bootstrapError$en bootstrapError = Translations$core$bootstrapError$en.internal(_root);
	late final Translations$core$macosNotifications$en macosNotifications = Translations$core$macosNotifications$en.internal(_root);
	late final Translations$core$appErrorView$en appErrorView = Translations$core$appErrorView$en.internal(_root);
	late final Translations$core$errorReportDialog$en errorReportDialog = Translations$core$errorReportDialog$en.internal(_root);
	late final Translations$core$windowControls$en windowControls = Translations$core$windowControls$en.internal(_root);
	late final Translations$core$crash$en crash = Translations$core$crash$en.internal(_root);
	late final Translations$core$menu$en menu = Translations$core$menu$en.internal(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Got it'
	String get gotIt => 'Got it';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Test'
	String get test => 'Test';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Loading…'
	String get loading => 'Loading…';

	/// en: 'Checking…'
	String get checking => 'Checking…';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Restart'
	String get restart => 'Restart';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Send'
	String get send => 'Send';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Dismiss'
	String get dismiss => 'Dismiss';

	/// en: 'Report'
	String get report => 'Report';

	/// en: 'Copy code'
	String get copyCode => 'Copy code';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'No results'
	String get noResults => 'No results';
}

// Path: flightdeck
class Translations$flightdeck$en {
	Translations$flightdeck$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$flightdeck$confirmDialog$en confirmDialog = Translations$flightdeck$confirmDialog$en.internal(_root);
	late final Translations$flightdeck$historyDialog$en historyDialog = Translations$flightdeck$historyDialog$en.internal(_root);
	late final Translations$flightdeck$worktreeCreateDialog$en worktreeCreateDialog = Translations$flightdeck$worktreeCreateDialog$en.internal(_root);
	late final Translations$flightdeck$subfolderDialog$en subfolderDialog = Translations$flightdeck$subfolderDialog$en.internal(_root);
	late final Translations$flightdeck$commitMessageDialog$en commitMessageDialog = Translations$flightdeck$commitMessageDialog$en.internal(_root);
	late final Translations$flightdeck$agentEditDialog$en agentEditDialog = Translations$flightdeck$agentEditDialog$en.internal(_root);
	late final Translations$flightdeck$agentSetupChecklist$en agentSetupChecklist = Translations$flightdeck$agentSetupChecklist$en.internal(_root);
	late final Translations$flightdeck$agentComposer$en agentComposer = Translations$flightdeck$agentComposer$en.internal(_root);
	late final Translations$flightdeck$tasksPanel$en tasksPanel = Translations$flightdeck$tasksPanel$en.internal(_root);
	late final Translations$flightdeck$flightdeckPage$en flightdeckPage = Translations$flightdeck$flightdeckPage$en.internal(_root);
	late final Translations$flightdeck$welcomeView$en welcomeView = Translations$flightdeck$welcomeView$en.internal(_root);
	late final Translations$flightdeck$modelPicker$en modelPicker = Translations$flightdeck$modelPicker$en.internal(_root);
	late final Translations$flightdeck$paneView$en paneView = Translations$flightdeck$paneView$en.internal(_root);
	late final Translations$flightdeck$fileTreePanel$en fileTreePanel = Translations$flightdeck$fileTreePanel$en.internal(_root);
	late final Translations$flightdeck$fileViewer$en fileViewer = Translations$flightdeck$fileViewer$en.internal(_root);
	late final Translations$flightdeck$workspaceSettingsDialog$en workspaceSettingsDialog = Translations$flightdeck$workspaceSettingsDialog$en.internal(_root);
	late final Translations$flightdeck$realmDialogs$en realmDialogs = Translations$flightdeck$realmDialogs$en.internal(_root);
	late final Translations$flightdeck$dbRedisTable$en dbRedisTable = Translations$flightdeck$dbRedisTable$en.internal(_root);
	late final Translations$flightdeck$dbQueryView$en dbQueryView = Translations$flightdeck$dbQueryView$en.internal(_root);
	late final Translations$flightdeck$httpView$en httpView = Translations$flightdeck$httpView$en.internal(_root);
	late final Translations$flightdeck$kanbanView$en kanbanView = Translations$flightdeck$kanbanView$en.internal(_root);
	late final Translations$flightdeck$dbPanel$en dbPanel = Translations$flightdeck$dbPanel$en.internal(_root);
	late final Translations$flightdeck$dbMongoView$en dbMongoView = Translations$flightdeck$dbMongoView$en.internal(_root);
	late final Translations$flightdeck$dbConnectionDialog$en dbConnectionDialog = Translations$flightdeck$dbConnectionDialog$en.internal(_root);
	late final Translations$flightdeck$sshPrompts$en sshPrompts = Translations$flightdeck$sshPrompts$en.internal(_root);
	late final Translations$flightdeck$projectsRail$en projectsRail = Translations$flightdeck$projectsRail$en.internal(_root);
	late final Translations$flightdeck$findBar$en findBar = Translations$flightdeck$findBar$en.internal(_root);
	late final Translations$flightdeck$contentSearch$en contentSearch = Translations$flightdeck$contentSearch$en.internal(_root);
	late final Translations$flightdeck$emptyPane$en emptyPane = Translations$flightdeck$emptyPane$en.internal(_root);
	late final Translations$flightdeck$topbar$en topbar = Translations$flightdeck$topbar$en.internal(_root);
	late final Translations$flightdeck$transcript$en transcript = Translations$flightdeck$transcript$en.internal(_root);
	late final Translations$flightdeck$tasks$en tasks = Translations$flightdeck$tasks$en.internal(_root);
	late final Translations$flightdeck$notifications$en notifications = Translations$flightdeck$notifications$en.internal(_root);
	late final Translations$flightdeck$terminal$en terminal = Translations$flightdeck$terminal$en.internal(_root);
	late final Translations$flightdeck$remoteHost$en remoteHost = Translations$flightdeck$remoteHost$en.internal(_root);
	late final Translations$flightdeck$browserPane$en browserPane = Translations$flightdeck$browserPane$en.internal(_root);
	late final Translations$flightdeck$gallery$en gallery = Translations$flightdeck$gallery$en.internal(_root);
	late final Translations$flightdeck$notebook$en notebook = Translations$flightdeck$notebook$en.internal(_root);
}

// Path: settings
class Translations$settings$en {
	Translations$settings$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$settings$language$en language = Translations$settings$language$en.internal(_root);
	late final Translations$settings$revokeDialog$en revokeDialog = Translations$settings$revokeDialog$en.internal(_root);
	late final Translations$settings$pairingDialog$en pairingDialog = Translations$settings$pairingDialog$en.internal(_root);
	late final Translations$settings$page$en page = Translations$settings$page$en.internal(_root);
	late final Translations$settings$remoteHosts$en remoteHosts = Translations$settings$remoteHosts$en.internal(_root);
}

// Path: automation
class Translations$automation$en {
	Translations$automation$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$automation$error$en error = Translations$automation$error$en.internal(_root);
}

// Path: fileOperation
class Translations$fileOperation$en {
	Translations$fileOperation$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$fileOperation$error$en error = Translations$fileOperation$error$en.internal(_root);
}

// Path: theme
class Translations$theme$en {
	Translations$theme$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$theme$error$en error = Translations$theme$error$en.internal(_root);
}

// Path: core.bootstrapError
class Translations$core$bootstrapError$en {
	Translations$core$bootstrapError$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to initialize FlightDeck'
	String get title => 'Failed to initialize FlightDeck';

	/// en: 'Retry'
	String get retry => 'Retry';
}

// Path: core.macosNotifications
class Translations$core$macosNotifications$en {
	Translations$core$macosNotifications$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enable Notifications on macOS'
	String get title => 'Enable Notifications on macOS';

	/// en: 'Notifications are currently disabled in your system settings. Follow the steps below to enable them:'
	String get intro => 'Notifications are currently disabled in your system settings. Follow the steps below to enable them:';

	/// en: 'Open System Settings on your Mac.'
	String get step1 => 'Open System Settings on your Mac.';

	/// en: 'Navigate to the Notifications section in the left sidebar.'
	String get step2 => 'Navigate to the Notifications section in the left sidebar.';

	/// en: 'Find and select the FlightDeck application from the list.'
	String get step3 => 'Find and select the FlightDeck application from the list.';

	/// en: 'Toggle the Allow Notifications switch on.'
	String get step4 => 'Toggle the Allow Notifications switch on.';

	/// en: 'Tip: If the app does not appear in the list, close and reopen it to trigger its registration in the system.'
	String get tip => 'Tip: If the app does not appear in the list, close and reopen it to trigger its registration in the system.';

	/// en: 'Got it'
	String get gotIt => 'Got it';
}

// Path: core.appErrorView
class Translations$core$appErrorView$en {
	Translations$core$appErrorView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'This part of the app failed to render'
	String get renderFailed => 'This part of the app failed to render';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Render error'
	String get renderErrorTitle => 'Render error';
}

// Path: core.errorReportDialog
class Translations$core$errorReportDialog$en {
	Translations$core$errorReportDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Something went wrong. The details below were saved to the log — you can report them so it gets fixed.'
	String get defaultDescription => 'Something went wrong. The details below were saved to the log — you can report them so it gets fixed.';

	/// en: 'Copy details'
	String get copyDetails => 'Copy details';

	/// en: 'Report issue'
	String get reportIssue => 'Report issue';
}

// Path: core.windowControls
class Translations$core$windowControls$en {
	Translations$core$windowControls$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Minimize'
	String get minimize => 'Minimize';

	/// en: 'Maximize'
	String get maximize => 'Maximize';

	/// en: 'Close'
	String get close => 'Close';
}

// Path: core.crash
class Translations$core$crash$en {
	Translations$core$crash$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected shutdown'
	String get title => 'Unexpected shutdown';

	/// en: 'FlightDeck closed unexpectedly'
	String get bannerTitle => 'FlightDeck closed unexpectedly';

	/// en: 'Report'
	String get report => 'Report';

	/// en: 'Dismiss'
	String get dismiss => 'Dismiss';

	/// en: 'The previous session (version ${version}) ended without shutting down cleanly. Want to report it? The log is included and you can review everything before sending.'
	String crashMessage({required Object version}) => 'The previous session (version ${version}) ended without shutting down cleanly. Want to report it? The log is included and you can review everything before sending.';

	/// en: 'Session started at ${startedAt} (pid ${pid}) ended without a clean shutdown.'
	String crashError({required Object startedAt, required Object pid}) => 'Session started at ${startedAt} (pid ${pid}) ended without a clean shutdown.';

	/// en: 'No error was captured — the app was terminated by the system. The log below is from that session and is the most useful part.'
	String get crashDescription => 'No error was captured — the app was terminated by the system. The log below is from that session and is the most useful part.';
}

// Path: core.menu
class Translations$core$menu$en {
	Translations$core$menu$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings…'
	String get settings => 'Settings…';

	/// en: 'Check for Updates…'
	String get checkForUpdates => 'Check for Updates…';

	/// en: 'File'
	String get file => 'File';

	/// en: 'New Agent'
	String get newAgent => 'New Agent';

	/// en: 'New Terminal'
	String get newTerminal => 'New Terminal';

	/// en: 'Open Workspace'
	String get openWorkspace => 'Open Workspace';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Discard'
	String get discard => 'Discard';

	/// en: 'Format'
	String get format => 'Format';

	/// en: 'View'
	String get view => 'View';

	/// en: 'Toggle Workspace Panel'
	String get toggleWorkspacePanel => 'Toggle Workspace Panel';

	/// en: 'Toggle Files'
	String get toggleFiles => 'Toggle Files';

	/// en: 'Split Right'
	String get splitRight => 'Split Right';

	/// en: 'Split Down'
	String get splitDown => 'Split Down';

	/// en: 'Focus Pane'
	String get focusPane => 'Focus Pane';

	/// en: 'Left (⌘⌥←)'
	String get focusLeft => 'Left  (⌘⌥←)';

	/// en: 'Right (⌘⌥→)'
	String get focusRight => 'Right  (⌘⌥→)';

	/// en: 'Up (⌘⌥↑)'
	String get focusUp => 'Up  (⌘⌥↑)';

	/// en: 'Down (⌘⌥↓)'
	String get focusDown => 'Down  (⌘⌥↓)';

	/// en: 'Select Tab'
	String get selectTab => 'Select Tab';

	/// en: 'Tab ${n}'
	String tabN({required Object n}) => 'Tab ${n}';

	/// en: 'Last Tab'
	String get lastTab => 'Last Tab';

	/// en: 'Zoom In'
	String get zoomIn => 'Zoom In';

	/// en: 'Zoom Out'
	String get zoomOut => 'Zoom Out';

	/// en: 'Actual Size'
	String get actualSize => 'Actual Size';

	/// en: 'Window'
	String get window => 'Window';

	/// en: 'Quit'
	String get quit => 'Quit';

	/// en: 'Minimize'
	String get minimize => 'Minimize';

	/// en: 'Zoom'
	String get zoom => 'Zoom';
}

// Path: flightdeck.confirmDialog
class Translations$flightdeck$confirmDialog$en {
	Translations$flightdeck$confirmDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unsaved changes'
	String get unsavedChangesTitle => 'Unsaved changes';

	/// en: '“${fileName}” has unsaved changes. Save them before closing?'
	String unsavedChangesMessage({required Object fileName}) => '“${fileName}” has unsaved changes. Save them before closing?';

	/// en: 'Don't save'
	String get dontSave => 'Don\'t save';

	/// en: 'Save & close'
	String get saveAndClose => 'Save & close';
}

// Path: flightdeck.historyDialog
class Translations$flightdeck$historyDialog$en {
	Translations$flightdeck$historyDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Session history'
	String get title => 'Session history';

	/// en: 'Opening one replaces this agent's current transcript'
	String get subtitle => 'Opening one replaces this agent\'s current transcript';

	/// en: 'No saved sessions in this folder.'
	String get empty => 'No saved sessions in this folder.';

	/// en: 'Untitled session'
	String get untitledSession => 'Untitled session';

	/// en: 'now'
	String get justNow => 'now';

	/// en: '${n} min ago'
	String minutesAgo({required Object n}) => '${n} min ago';

	/// en: '${n} h ago'
	String hoursAgo({required Object n}) => '${n} h ago';

	/// en: '${n} d ago'
	String daysAgo({required Object n}) => '${n} d ago';
}

// Path: flightdeck.worktreeCreateDialog
class Translations$flightdeck$worktreeCreateDialog$en {
	Translations$flightdeck$worktreeCreateDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Fork worktree'
	String get forkTitle => 'Fork worktree';

	/// en: 'Create worktree'
	String get createTitle => 'Create worktree';

	/// en: 'New worktree branched from ${root}.'
	String forkSubtitle({required Object root}) => 'New worktree branched from ${root}.';

	/// en: 'New feature in ${root} — new branch from the current HEAD.'
	String createSubtitle({required Object root}) => 'New feature in ${root} — new branch from the current HEAD.';

	/// en: 'feat/minha-feature'
	String get namePlaceholder => 'feat/minha-feature';

	/// en: 'No spaces in the name.'
	String get errorWhitespace => 'No spaces in the name.';

	/// en: 'Invalid character for a branch name.'
	String get errorInvalidChar => 'Invalid character for a branch name.';

	/// en: 'Invalid sequence (e.g. "..", "//", starting/ending with "/").'
	String get errorInvalidSequence => 'Invalid sequence (e.g. "..", "//", starting/ending with "/").';

	/// en: 'Reserved position (do not start with "-"/"." or end with ".lock").'
	String get errorReserved => 'Reserved position (do not start with "-"/"." or end with ".lock").';

	/// en: 'A branch with that name already exists.'
	String get errorDuplicateBranch => 'A branch with that name already exists.';

	/// en: 'A worktree with that name already exists.'
	String get errorDuplicateWorktree => 'A worktree with that name already exists.';

	/// en: 'Cannot create branch '${target}' because it conflicts with the existing branch '${existing}'.'
	String errorBranchHierarchyConflict({required Object target, required Object existing}) => 'Cannot create branch \'${target}\' because it conflicts with the existing branch \'${existing}\'.';

	/// en: 'A branch with a conflicting hierarchy already exists.'
	String get errorBranchHierarchicalConflictGeneral => 'A branch with a conflicting hierarchy already exists.';

	/// en: 'Fork'
	String get fork => 'Fork';

	/// en: 'This repository has a post-checkout hook.'
	String get postCheckoutHint => 'This repository has a post-checkout hook.';

	/// en: 'Running…'
	String get running => 'Running…';

	/// en: 'Advanced Settings'
	String get advancedSettings => 'Advanced Settings';

	/// en: 'Copy ignored files (.gitignore)'
	String get copyIgnored => 'Copy ignored files (.gitignore)';

	/// en: 'Copies files ignored by .gitignore (e.g. .env, local keys) to the new worktree.'
	String get copyIgnoredDesc => 'Copies files ignored by .gitignore (e.g. .env, local keys) to the new worktree.';

	/// en: 'Copy untracked files'
	String get copyUntracked => 'Copy untracked files';

	/// en: 'Copies new or modified files that haven't been staged yet.'
	String get copyUntrackedDesc => 'Copies new or modified files that haven\'t been staged yet.';

	/// en: 'Base branch'
	String get baseBranch => 'Base branch';

	/// en: 'The branch from which the new worktree and branch will be created.'
	String get baseBranchDesc => 'The branch from which the new worktree and branch will be created.';

	/// en: 'Fetch remote branch'
	String get fetchRemote => 'Fetch remote branch';

	/// en: 'Run git fetch to guarantee the base branch is confirmed before creating the worktree.'
	String get fetchRemoteDesc => 'Run git fetch to guarantee the base branch is confirmed before creating the worktree.';

	/// en: 'Search branch...'
	String get searchBranch => 'Search branch...';

	/// en: 'Back'
	String get back => 'Back';
}

// Path: flightdeck.subfolderDialog
class Translations$flightdeck$subfolderDialog$en {
	Translations$flightdeck$subfolderDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Where to work?'
	String get title => 'Where to work?';

	/// en: 'No subfolders here.'
	String get empty => 'No subfolders here.';

	/// en: 'Use the root of ${project}'
	String useRoot({required Object project}) => 'Use the root of ${project}';

	/// en: 'Use ${project}/${rel}'
	String usePath({required Object project, required Object rel}) => 'Use ${project}/${rel}';

	/// en: 'Use this folder'
	String get useThisFolder => 'Use this folder';
}

// Path: flightdeck.commitMessageDialog
class Translations$flightdeck$commitMessageDialog$en {
	Translations$flightdeck$commitMessageDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Commit'
	String get commitTitle => 'Commit';

	/// en: 'Stage and Commit'
	String get stageAndCommitTitle => 'Stage and Commit';

	/// en: 'Commit "${fileName}" only.'
	String scopeNote({required Object fileName}) => 'Commit "${fileName}" only.';

	/// en: 'fix: short summary of the change'
	String get placeholder => 'fix: short summary of the change';

	/// en: 'The first line (subject) cannot be empty.'
	String get errorEmptySubject => 'The first line (subject) cannot be empty.';

	/// en: 'Subject too short (min ${min} characters).'
	String errorTooShort({required Object min}) => 'Subject too short (min ${min} characters).';

	/// en: 'Subject too long (max ${max} characters).'
	String errorTooLong({required Object max}) => 'Subject too long (max ${max} characters).';

	/// en: 'Subject should not end with a period.'
	String get errorTrailingPeriod => 'Subject should not end with a period.';

	/// en: 'Subject contains control characters.'
	String get errorControlChars => 'Subject contains control characters.';

	/// en: 'Leave the second line blank (git subject/body separator).'
	String get errorBlankSecondLine => 'Leave the second line blank (git subject/body separator).';

	/// en: 'Generate commit message'
	String get generate => 'Generate commit message';

	/// en: 'Generate with ${harness}'
	String generateWith({required Object harness}) => 'Generate with ${harness}';

	/// en: 'Generating…'
	String get generating => 'Generating…';

	/// en: 'Cancel generation'
	String get cancelGeneration => 'Cancel generation';
}

// Path: flightdeck.agentEditDialog
class Translations$flightdeck$agentEditDialog$en {
	Translations$flightdeck$agentEditDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit agent'
	String get title => 'Edit agent';

	/// en: 'Agent name'
	String get agentName => 'Agent name';

	/// en: 'Relay (remote-pi)'
	String get relaySection => 'Relay (remote-pi)';

	/// en: 'Auto-connect on start'
	String get autoConnect => 'Auto-connect on start';

	/// en: 'Information'
	String get informationSection => 'Information';

	/// en: 'Folder'
	String get folder => 'Folder';

	/// en: 'Model'
	String get model => 'Model';

	/// en: 'State'
	String get state => 'State';

	/// en: 'Context'
	String get context => 'Context';

	/// en: 'empty'
	String get statusEmpty => 'empty';

	/// en: 'starting'
	String get statusStarting => 'starting';

	/// en: 'ready'
	String get statusReady => 'ready';

	/// en: 'streaming'
	String get statusStreaming => 'streaming';

	/// en: 'ended'
	String get statusEnded => 'ended';
}

// Path: flightdeck.agentSetupChecklist
class Translations$flightdeck$agentSetupChecklist$en {
	Translations$flightdeck$agentSetupChecklist$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Set up the agent environment'
	String get title => 'Set up the agent environment';

	/// en: 'Running an agent needs Pi installed. Complete the steps below — terminals and files work without any of this.'
	String get intro => 'Running an agent needs Pi installed. Complete the steps below — terminals and files work without any of this.';

	/// en: 'Pi Code installed'
	String get step1Title => 'Pi Code installed';

	/// en: 'The `pi` binary must be accessible.'
	String get step1Description => 'The `pi` binary must be accessible.';

	/// en: 'remote-pi extension on Pi'
	String get step2Title => 'remote-pi extension on Pi';

	/// en: 'Registered in ~/.pi/agent/settings.json.'
	String get step2Description => 'Registered in ~/.pi/agent/settings.json.';

	/// en: 'Supervisor installed'
	String get step3Title => 'Supervisor installed';

	/// en: 'pi-supervisord service (remote-pi install).'
	String get step3Description => 'pi-supervisord service (remote-pi install).';

	/// en: 'Install'
	String get install => 'Install';

	/// en: 'Install remote-pi extension'
	String get installExtensionTitle => 'Install remote-pi extension';

	/// en: 'Install supervisor'
	String get installSupervisorTitle => 'Install supervisor';

	/// en: 'Create agent'
	String get createAgent => 'Create agent';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Check again'
	String get checkAgain => 'Check again';

	/// en: 'Not required in this setup'
	String get notRequired => 'Not required in this setup';

	/// en: 'Installing…'
	String get installing => 'Installing…';

	/// en: 'Installed successfully.'
	String get installedSuccessfully => 'Installed successfully.';
}

// Path: flightdeck.agentComposer
class Translations$flightdeck$agentComposer$en {
	Translations$flightdeck$agentComposer$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New session — clears the conversation'
	String get cmdNewDescription => 'New session — clears the conversation';

	/// en: 'Compacts the agent context'
	String get cmdCompactDescription => 'Compacts the agent context';

	/// en: 'Attach file'
	String get attachFile => 'Attach file';

	/// en: 'Maximum of ${max} images.'
	String maxImages({required Object max}) => 'Maximum of ${max} images.';

	/// en: 'Message to the agent, use @files or /commands'
	String get placeholder => 'Message to the agent, use @files or /commands';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Send'
	String get send => 'Send';

	/// en: 'Relay online'
	String get relayOnline => 'Relay online';

	/// en: 'Relay reconnecting...'
	String get relayReconnecting => 'Relay reconnecting...';

	/// en: 'Relay offline'
	String get relayOffline => 'Relay offline';

	/// en: 'Context: ${pct}% of the window'
	String contextTooltip({required Object pct}) => 'Context: ${pct}% of the window';

	/// en: 'The current model cannot see images — switch to one with vision.'
	String get visionWarning => 'The current model cannot see images — switch to one with vision.';

	/// en: 'model'
	String get modelFallback => 'model';
}

// Path: flightdeck.tasksPanel
class Translations$flightdeck$tasksPanel$en {
	Translations$flightdeck$tasksPanel$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Reload tasks'
	String get reloadTasksTooltip => 'Reload tasks';

	/// en: 'Restart'
	String get restartTooltip => 'Restart';

	/// en: 'Stop'
	String get stopTooltip => 'Stop';

	/// en: 'Run'
	String get runTooltip => 'Run';

	/// en: '${label} (sends '${key}')'
	String sendsKeyTooltip({required Object label, required Object key}) => '${label} (sends \'${key}\')';

	/// en: 'Starting…'
	String get startingTooltip => 'Starting…';

	/// en: 'Stopping…'
	String get stoppingTooltip => 'Stopping…';

	/// en: 'Switch profile'
	String get switchProfileTooltip => 'Switch profile';

	/// en: 'More keys'
	String get moreKeysTooltip => 'More keys';

	/// en: 'TASKS'
	String get sectionTasks => 'TASKS';

	/// en: 'No tasks detected in this project.'
	String get noTasks => 'No tasks detected in this project.';

	/// en: 'Create tasks.json'
	String get createTasksJson => 'Create tasks.json';
}

// Path: flightdeck.flightdeckPage
class Translations$flightdeck$flightdeckPage$en {
	Translations$flightdeck$flightdeckPage$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose the project folder'
	String get chooseProjectFolderDialogTitle => 'Choose the project folder';

	/// en: 'Choose the workspace folder'
	String get chooseWorkspaceFolderDialogTitle => 'Choose the workspace folder';

	/// en: 'Workspace renamed'
	String get workspaceRenamedTitle => 'Workspace renamed';

	/// en: 'The new name "${name}" will only be sent to agents after restarting the workspace or the application.'
	String workspaceRenamedMessage({required Object name}) => 'The new name "${name}" will only be sent to agents after restarting the workspace or the application.';

	/// en: 'Sync — ${label}'
	String syncTitle({required Object label}) => 'Sync — ${label}';

	/// en: 'Pull — ${label}'
	String pullTitle({required Object label}) => 'Pull — ${label}';

	/// en: 'Push — ${label}'
	String pushTitle({required Object label}) => 'Push — ${label}';

	/// en: 'Update from Parent — ${name}'
	String updateFromParentTitle({required Object name}) => 'Update from Parent — ${name}';

	/// en: 'Merge to Parent — ${name}'
	String mergeToParentTitle({required Object name}) => 'Merge to Parent — ${name}';

	/// en: 'Worktree merged and removed.'
	String get worktreeMergedAndRemoved => 'Worktree merged and removed.';

	/// en: 'Nothing was changed.'
	String get nothingWasChanged => 'Nothing was changed.';

	/// en: 'New realm'
	String get newRealmTitle => 'New realm';

	/// en: 'Close workspace'
	String get closeWorkspaceTitle => 'Close workspace';

	/// en: 'Close "${name}"? The agents in this workspace will be terminated. The folder on disk is kept.'
	String closeWorkspaceMessage({required Object name}) => 'Close "${name}"? The agents in this workspace will be terminated. The folder on disk is kept.';

	/// en: 'Close'
	String get closeAction => 'Close';

	/// en: 'Remove worktree'
	String get removeWorktreeTitle => 'Remove worktree';

	/// en: 'Remove "${name}"? The worktree folder and the branch will be deleted and the agents in this fork will be terminated.${warn}'
	String removeWorktreeMessage({required Object name, required Object warn}) => 'Remove "${name}"? The worktree folder and the branch will be deleted and the agents in this fork will be terminated.${warn}';

	/// en: ' Warning: the branch "${name}" has not been merged yet — removing it (git branch -D) discards the unmerged work.'
	String removeWorktreeWarning({required Object name}) => '\n\nWarning: the branch "${name}" has not been merged yet — removing it (git branch -D) discards the unmerged work.';

	/// en: 'Failed to remove worktree'
	String get failedToRemoveWorktreeTitle => 'Failed to remove worktree';

	/// en: 'Open layout'
	String get openLayoutTitle => 'Open layout';

	/// en: 'Restart server'
	String get restartServerTooltip => 'Restart server';

	/// en: 'No LSP available'
	String get noLspAvailable => 'No LSP available';

	/// en: 'running'
	String get lspRunning => 'running';

	/// en: 'stopped'
	String get lspStopped => 'stopped';
}

// Path: flightdeck.welcomeView
class Translations$flightdeck$welcomeView$en {
	Translations$flightdeck$welcomeView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome to FlightDeck'
	String get title => 'Welcome to FlightDeck';

	/// en: 'Open a folder or connect to a remote host to start.'
	String get subtitle => 'Open a folder or connect to a remote host to start.';

	/// en: 'Create workspace'
	String get createWorkspace => 'Create workspace';

	/// en: 'Open local folder'
	String get openLocalFolder => 'Open local folder';

	/// en: 'Connect to host'
	String get connectHost => 'Connect to host';

	/// en: 'Configure host'
	String get configureHost => 'Configure host';

	/// en: 'Add workspace'
	String get addWorkspace => 'Add workspace';
}

// Path: flightdeck.modelPicker
class Translations$flightdeck$modelPicker$en {
	Translations$flightdeck$modelPicker$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search model (${count})'
	String search({required Object count}) => 'Search model (${count})';
}

// Path: flightdeck.paneView
class Translations$flightdeck$paneView$en {
	Translations$flightdeck$paneView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Close pane?'
	String get closePaneTitle => 'Close pane?';

	/// en: 'This closes all ${count} tab(s) in this pane and ends the agents/terminals in it.'
	String closePaneMessage({required Object count}) => 'This closes all ${count} tab(s) in this pane and ends the agents/terminals in it.';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'All tabs'
	String get allTabs => 'All tabs';

	/// en: 'Pin tab'
	String get pinTab => 'Pin tab';

	/// en: 'Rename'
	String get rename => 'Rename';

	/// en: 'Open as markdown'
	String get openAsMarkdown => 'Open as markdown';

	/// en: 'Open as board'
	String get openAsBoard => 'Open as board';

	/// en: 'Reset Title'
	String get resetTitle => 'Reset Title';

	/// en: 'Copy Id'
	String get copyId => 'Copy Id';

	/// en: 'Auto-relay'
	String get autoRelay => 'Auto-relay';

	/// en: 'History'
	String get history => 'History';

	/// en: 'New tab'
	String get newTab => 'New tab';

	/// en: 'New terminal…'
	String get newTerminal => 'New terminal…';

	/// en: 'Split right'
	String get splitRight => 'Split right';

	/// en: 'Split down'
	String get splitDown => 'Split down';

	/// en: 'Close pane'
	String get closePane => 'Close pane';

	/// en: 'Drop here to move the tab'
	String get dropHereToMove => 'Drop here to move the tab';

	/// en: 'Dock as tab'
	String get dockAsTab => 'Dock as tab';

	/// en: 'Open browser'
	String get openBrowser => 'Open browser';

	/// en: 'Open terminal'
	String get openTerminal => 'Open terminal';
}

// Path: flightdeck.fileTreePanel
class Translations$flightdeck$fileTreePanel$en {
	Translations$flightdeck$fileTreePanel$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'View Diff'
	String get viewDiff => 'View Diff';

	/// en: 'Commit'
	String get commit => 'Commit';

	/// en: 'Stage and Commit'
	String get stageAndCommit => 'Stage and Commit';

	/// en: 'Unstage'
	String get unstage => 'Unstage';

	/// en: 'Stage Changes'
	String get stageChanges => 'Stage Changes';

	/// en: 'Discard Changes'
	String get discardChanges => 'Discard Changes';

	/// en: 'Enter a commit message.'
	String get enterCommitMessage => 'Enter a commit message.';

	/// en: 'Commit is unavailable for this workspace.'
	String get commitUnavailable => 'Commit is unavailable for this workspace.';

	/// en: 'Git error'
	String get gitErrorTitle => 'Git error';

	/// en: 'Delete new file?'
	String get deleteNewFileTitle => 'Delete new file?';

	/// en: 'Discard changes?'
	String get discardChangesTitle => 'Discard changes?';

	/// en: '"${name}" is a new file and cannot be restored. Delete it?'
	String deleteNewFileMessage({required Object name}) => '"${name}" is a new file and cannot be restored. Delete it?';

	/// en: 'Discard all changes in "${name}"? Deleted files will be restored.'
	String discardOneMessage({required Object name}) => 'Discard all changes in "${name}"? Deleted files will be restored.';

	/// en: 'Discard'
	String get discard => 'Discard';

	/// en: 'Delete all new files?'
	String get deleteAllNewFilesTitle => 'Delete all new files?';

	/// en: 'All ${count} files are new and will be deleted. This cannot be undone.'
	String allNewFilesMessage({required Object count}) => 'All ${count} files are new and will be deleted. This cannot be undone.';

	/// en: 'Discard changes in ${count} tracked file(s)?${extra}'
	String discardTrackedMessage({required Object count, required Object extra}) => 'Discard changes in ${count} tracked file(s)?${extra}';

	/// en: ' ${count} new file(s) will be kept.'
	String discardTrackedExtra({required Object count}) => ' ${count} new file(s) will be kept.';

	/// en: 'Delete All'
	String get deleteAll => 'Delete All';

	/// en: 'Delete?'
	String get deleteQuestionTitle => 'Delete?';

	/// en: 'Move “${name}” to the Trash?'
	String moveToTrash({required Object name}) => 'Move “${name}” to the Trash?';

	/// en: 'Permanently delete “${name}”? This can’t be undone.'
	String permanentlyDelete({required Object name}) => 'Permanently delete “${name}”? This can’t be undone.';

	/// en: 'Could not delete'
	String get couldNotDeleteTitle => 'Could not delete';

	/// en: 'Move?'
	String get moveQuestionTitle => 'Move?';

	/// en: 'Move “${name}” to “${dest}”?'
	String moveMessage({required Object name, required Object dest}) => 'Move “${name}” to “${dest}”?';

	/// en: 'Move'
	String get moveAction => 'Move';

	/// en: 'Could not move'
	String get couldNotMoveTitle => 'Could not move';

	/// en: 'Could not paste'
	String get couldNotPasteTitle => 'Could not paste';

	/// en: 'Files'
	String get filesTooltip => 'Files';

	/// en: 'Search'
	String get searchTooltip => 'Search';

	/// en: 'Source Control'
	String get sourceControlTooltip => 'Source Control';

	/// en: 'Database'
	String get databaseTooltip => 'Database';

	/// en: 'FILES'
	String get sectionFiles => 'FILES';

	/// en: 'New file'
	String get newFile => 'New file';

	/// en: 'New folder'
	String get newFolder => 'New folder';

	/// en: 'Refresh'
	String get refreshTooltip => 'Refresh';

	/// en: 'Collapse all folders'
	String get collapseAll => 'Collapse all folders';

	/// en: 'SOURCE CONTROL'
	String get sectionSourceControl => 'SOURCE CONTROL';

	/// en: 'View as List'
	String get viewAsList => 'View as List';

	/// en: 'View as Tree'
	String get viewAsTree => 'View as Tree';

	/// en: 'No folder — open a workspace.'
	String get noFolderMessage => 'No folder — open a workspace.';

	/// en: 'Amend'
	String get amend => 'Amend';

	/// en: 'Commit Message'
	String get commitMessagePlaceholder => 'Commit Message';

	/// en: 'Amend Commit'
	String get amendCommit => 'Amend Commit';

	/// en: 'last commit'
	String get lastCommit => 'last commit';

	/// en: 'Open in Finder'
	String get openInFinder => 'Open in Finder';

	/// en: 'Open in Explorer'
	String get openInExplorer => 'Open in Explorer';

	/// en: 'Open in file manager'
	String get openInFileManager => 'Open in file manager';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Open with'
	String get openWith => 'Open with';

	/// en: 'Open layout'
	String get openLayout => 'Open layout';

	/// en: 'Open as markdown'
	String get openAsMarkdown => 'Open as markdown';

	/// en: 'Show git diff'
	String get showGitDiff => 'Show git diff';

	/// en: 'Create agent'
	String get createAgent => 'Create agent';

	/// en: 'Create terminal'
	String get createTerminal => 'Create terminal';

	/// en: 'Rename'
	String get rename => 'Rename';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Cut'
	String get cut => 'Cut';

	/// en: 'Paste'
	String get paste => 'Paste';

	/// en: 'Copy relative path'
	String get copyRelativePath => 'Copy relative path';

	/// en: 'Copy absolute path'
	String get copyAbsolutePath => 'Copy absolute path';

	/// en: 'Rename failed.'
	String get renameFailed => 'Rename failed.';

	/// en: 'No changes.'
	String get noChanges => 'No changes.';

	/// en: 'STAGED CHANGES (${count})'
	String stagedChangesHeader({required Object count}) => 'STAGED CHANGES (${count})';

	/// en: 'CHANGES (${count})'
	String changesHeader({required Object count}) => 'CHANGES (${count})';

	/// en: 'Discard All Changes'
	String get discardAllChanges => 'Discard All Changes';

	/// en: 'Unstage All Changes'
	String get unstageAllChanges => 'Unstage All Changes';

	/// en: 'Stage All Changes'
	String get stageAllChanges => 'Stage All Changes';

	/// en: 'Discard Folder Changes'
	String get discardFolderChanges => 'Discard Folder Changes';

	/// en: 'Unstage Folder Changes'
	String get unstageFolderChanges => 'Unstage Folder Changes';

	/// en: 'Stage Folder Changes'
	String get stageFolderChanges => 'Stage Folder Changes';

	/// en: 'Generate commit message'
	String get generateCommitMessage => 'Generate commit message';

	/// en: 'Generate with ${harness}'
	String generateWith({required Object harness}) => 'Generate with ${harness}';

	/// en: 'Unavailable while amending a commit'
	String get generateUnavailableWhileAmending => 'Unavailable while amending a commit';

	/// en: 'Cancel generation'
	String get cancelGeneration => 'Cancel generation';

	/// en: 'Changes'
	String get changes => 'Changes';

	/// en: 'History'
	String get history => 'History';

	/// en: 'Repository'
	String get historyRepository => 'Repository';

	/// en: 'No Git repository available.'
	String get historyNoRepository => 'No Git repository available.';

	/// en: 'No commits found.'
	String get historyEmpty => 'No commits found.';

	/// en: 'Could not load Git history.'
	String get historyLoadFailed => 'Could not load Git history.';

	/// en: 'Untitled commit'
	String get historyUntitledCommit => 'Untitled commit';

	/// en: 'now'
	String get historyNow => 'now';

	/// en: '${count}m ago'
	String historyMinutesAgo({required Object count}) => '${count}m ago';

	/// en: '${count}h ago'
	String historyHoursAgo({required Object count}) => '${count}h ago';

	/// en: 'yesterday'
	String get historyYesterday => 'yesterday';

	/// en: '1d ago'
	String get historyDayAgo => '1d ago';

	/// en: '${count}d ago'
	String historyDaysAgo({required Object count}) => '${count}d ago';

	/// en: 'Files changed'
	String get historyFiles => 'Files changed';

	/// en: 'No files changed.'
	String get historyFilesEmpty => 'No files changed.';

	/// en: 'Could not load changed files.'
	String get historyFilesLoadFailed => 'Could not load changed files.';

	/// en: 'Empty tree'
	String get diffEmptyTree => 'Empty tree';

	/// en: 'Original ${ref}'
	String diffOriginal({required Object ref}) => 'Original ${ref}';

	/// en: 'Modified ${ref}'
	String diffModified({required Object ref}) => 'Modified ${ref}';

	/// en: 'Working tree'
	String get diffWorkingTree => 'Working tree';

	/// en: 'Binary file - no text diff.'
	String get diffBinaryFile => 'Binary file - no text diff.';

	/// en: 'No changes.'
	String get diffNoChanges => 'No changes.';

	/// en: 'Could not read the diff: ${detail}'
	String diffError({required Object detail}) => 'Could not read the diff: ${detail}';

	/// en: 'Gallery'
	String get galleryTooltip => 'Gallery';

	/// en: 'GALLERY'
	String get sectionGallery => 'GALLERY';
}

// Path: flightdeck.fileViewer
class Translations$flightdeck$fileViewer$en {
	Translations$flightdeck$fileViewer$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Can't open this file.'
	String get cantOpen => 'Can\'t open this file.';

	/// en: 'Could not load the image.'
	String get couldNotLoadImage => 'Could not load the image.';

	/// en: 'Preview'
	String get preview => 'Preview';

	/// en: 'Source'
	String get source => 'Source';
}

// Path: flightdeck.workspaceSettingsDialog
class Translations$flightdeck$workspaceSettingsDialog$en {
	Translations$flightdeck$workspaceSettingsDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose workspace photo'
	String get choosePhotoTitle => 'Choose workspace photo';

	/// en: 'Workspace settings'
	String get title => 'Workspace settings';

	/// en: 'Workspace name'
	String get namePlaceholder => 'Workspace name';

	/// en: 'Add photo'
	String get addPhoto => 'Add photo';

	/// en: 'Change photo'
	String get changePhoto => 'Change photo';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Color'
	String get color => 'Color';

	/// en: 'Host'
	String get host => 'Host';

	/// en: 'Folder'
	String get folder => 'Folder';
}

// Path: flightdeck.realmDialogs
class Translations$flightdeck$realmDialogs$en {
	Translations$flightdeck$realmDialogs$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Realm name'
	String get namePlaceholder => 'Realm name';

	/// en: 'A realm with this name already exists.'
	String get duplicateName => 'A realm with this name already exists.';

	/// en: 'New realm'
	String get newRealmTitle => 'New realm';

	/// en: 'Rename realm'
	String get renameRealmTitle => 'Rename realm';

	/// en: 'Rename'
	String get rename => 'Rename';

	/// en: 'Delete realm'
	String get deleteRealmTitle => 'Delete realm';

	/// en: 'Delete "${name}"? No workspace is deleted — the folder list just changes.${suffix}'
	String deleteMessage({required Object name, required Object suffix}) => 'Delete "${name}"? No workspace is deleted — the folder list just changes.${suffix}';

	/// en: ' Its workspace will move to Default.'
	String get deleteSuffixOne => ' Its workspace will move to Default.';

	/// en: ' Its ${count} workspaces will move to Default.'
	String deleteSuffixMany({required Object count}) => ' Its ${count} workspaces will move to Default.';

	/// en: 'Manage realms'
	String get manageRealmsTitle => 'Manage realms';

	/// en: '(one) {1 workspace} (other) {${n} workspaces}'
	String workspaceCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 workspace',
		other: '${n} workspaces',
	);
}

// Path: flightdeck.dbRedisTable
class Translations$flightdeck$dbRedisTable$en {
	Translations$flightdeck$dbRedisTable$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete key'
	String get deleteKeyTitle => 'Delete key';

	/// en: 'Delete "${key}" from this Redis database?'
	String deleteKeyMessage({required Object key}) => 'Delete "${key}" from this Redis database?';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'New key'
	String get newKey => 'New key';

	/// en: 'KEY'
	String get columnKey => 'KEY';

	/// en: 'VALUE'
	String get columnValue => 'VALUE';

	/// en: 'TYPE'
	String get columnType => 'TYPE';

	/// en: 'TTL'
	String get columnTtl => 'TTL';

	/// en: '(one) {1 key} (other) {${n} keys}'
	String keyCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 key',
		other: '${n} keys',
	);

	/// en: 'No keys in this database.'
	String get noKeys => 'No keys in this database.';

	/// en: 'No keys match "${pattern}".'
	String noKeysMatch({required Object pattern}) => 'No keys match "${pattern}".';

	/// en: 'Load more'
	String get loadMore => 'Load more';

	/// en: 'Loading full value…'
	String get loadingFullValue => 'Loading full value…';

	/// en: 'TTL must be a number of seconds.'
	String get ttlMustBeNumber => 'TTL must be a number of seconds.';

	/// en: 'Add key'
	String get addKey => 'Add key';

	/// en: 'key'
	String get keyFieldHint => 'key';

	/// en: 'ttl (s, optional)'
	String get ttlFieldHint => 'ttl (s, optional)';

	/// en: 'value'
	String get valueFieldHint => 'value';

	/// en: 'Search — pattern, e.g. user:*'
	String get searchHint => 'Search — pattern, e.g. user:*';
}

// Path: flightdeck.dbQueryView
class Translations$flightdeck$dbQueryView$en {
	Translations$flightdeck$dbQueryView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save query as'
	String get saveQueryAs => 'Save query as';

	/// en: 'Could not save'
	String get couldNotSave => 'Could not save';

	/// en: 'Select database'
	String get selectDatabase => 'Select database';

	/// en: 'No SQL connections'
	String get noSqlConnections => 'No SQL connections';

	/// en: 'Running…'
	String get running => 'Running…';

	/// en: 'Run selection'
	String get runSelection => 'Run selection';

	/// en: 'Run'
	String get run => 'Run';

	/// en: 'Pick a database above, then Run (⌘↵).'
	String get pickDatabaseHint => 'Pick a database above, then Run (⌘↵).';

	/// en: 'Run the query (⌘↵) to see results here.'
	String get runQueryHint => 'Run the query (⌘↵) to see results here.';

	/// en: 'No rows.'
	String get noRows => 'No rows.';

	/// en: '(one) {1 row affected} (other) {${n} rows affected}'
	String rowsAffected({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 row affected',
		other: '${n} rows affected',
	);

	/// en: '${n} rows'
	String rowsFooter({required Object n}) => '${n} rows';

	/// en: ' · truncated (raise -- limit)'
	String get truncatedSuffix => ' · truncated (raise -- limit)';

	/// en: 'Table'
	String get table => 'Table';

	/// en: 'JSON'
	String get json => 'JSON';

	/// en: 'unsaved'
	String get unsaved => 'unsaved';

	/// en: 'saved'
	String get saved => 'saved';

	/// en: 'Copied'
	String get copied => 'Copied';

	/// en: 'Copy'
	String get copy => 'Copy';
}

// Path: flightdeck.httpView
class Translations$flightdeck$httpView$en {
	Translations$flightdeck$httpView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save request as'
	String get saveRequestAs => 'Save request as';

	/// en: 'Could not save'
	String get couldNotSave => 'Could not save';

	/// en: 'Run'
	String get run => 'Run';

	/// en: 'Running…'
	String get running => 'Running…';

	/// en: 'No request in this file — write one, e.g. GET https://example.com'
	String get noRequests => 'No request in this file — write one, e.g. GET https://example.com';

	/// en: 'Select request'
	String get selectRequest => 'Select request';

	/// en: '(one) {1 request} (other) {${n} requests}'
	String requestCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 request',
		other: '${n} requests',
	);

	/// en: 'Run the request (⌘↵) to see the response here.'
	String get runHint => 'Run the request (⌘↵) to see the response here.';

	/// en: 'Empty response body.'
	String get emptyBody => 'Empty response body.';

	/// en: 'JSON'
	String get body => 'JSON';

	/// en: 'Headers'
	String get headers => 'Headers';

	/// en: 'Text'
	String get raw => 'Text';

	/// en: ' · truncated (response too large)'
	String get truncatedSuffix => ' · truncated (response too large)';

	late final Translations$flightdeck$httpView$error$en error = Translations$flightdeck$httpView$error$en.internal(_root);
}

// Path: flightdeck.kanbanView
class Translations$flightdeck$kanbanView$en {
	Translations$flightdeck$kanbanView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Board'
	String get boardView => 'Board';

	/// en: 'List'
	String get listView => 'List';

	/// en: 'Refresh from disk'
	String get refresh => 'Refresh from disk';

	/// en: 'Labels'
	String get manageLabels => 'Labels';

	/// en: 'Labels in this board'
	String get labelsTitle => 'Labels in this board';

	/// en: 'label name'
	String get labelNamePlaceholder => 'label name';

	/// en: '(one) {1 card} (other) {${n} cards}'
	String labelUsage({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 card',
		other: '${n} cards',
	);

	/// en: 'Delete label'
	String get deleteLabel => 'Delete label';

	/// en: 'new card'
	String get newCard => 'new card';

	/// en: 'New card'
	String get newCardTitle => 'New card';

	/// en: 'New column'
	String get newColumn => 'New column';

	/// en: 'Column name'
	String get columnNameTitle => 'Column name';

	/// en: 'Drag column'
	String get dragColumn => 'Drag column';

	/// en: 'Column options'
	String get columnOptions => 'Column options';

	/// en: 'Rename column'
	String get renameColumn => 'Rename column';

	/// en: 'Move left'
	String get moveColumnLeft => 'Move left';

	/// en: 'Move right'
	String get moveColumnRight => 'Move right';

	/// en: 'Delete column'
	String get deleteColumn => 'Delete column';

	/// en: 'New card here'
	String get newCardHere => 'New card here';

	/// en: 'Duplicate'
	String get duplicateCard => 'Duplicate';

	/// en: 'Labels'
	String get cardLabels => 'Labels';

	/// en: 'Delete card'
	String get deleteCard => 'Delete card';

	/// en: 'Move to next column'
	String get advance => 'Move to next column';

	/// en: 'Move back a column'
	String get advanceBack => 'Move back a column';

	/// en: 'No cards'
	String get emptyColumn => 'No cards';

	/// en: '(one) {1 card} (other) {${n} cards}'
	String cardCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 card',
		other: '${n} cards',
	);

	/// en: 'Note'
	String get notes => 'Note';

	/// en: 'Write a note'
	String get notesPlaceholder => 'Write a note';

	/// en: 'Comments'
	String get comments => 'Comments';

	/// en: 'Add comment'
	String get addComment => 'Add comment';

	/// en: 'Write a comment'
	String get commentPlaceholder => 'Write a comment';

	/// en: 'No comments yet'
	String get noComments => 'No comments yet';

	/// en: 'Close'
	String get closeDetail => 'Close';

	/// en: 'This file has no ## columns yet — it opens as markdown.'
	String get notABoard => 'This file has no ## columns yet — it opens as markdown.';

	/// en: 'Start a board'
	String get startBoard => 'Start a board';

	/// en: 'Could not save the board'
	String get couldNotSave => 'Could not save the board';

	/// en: 'Not recognized by the parser — drags whole, no inline editing.'
	String get unrecognizedBlock => 'Not recognized by the parser — drags whole, no inline editing.';

	late final Translations$flightdeck$kanbanView$deleteColumnDialog$en deleteColumnDialog = Translations$flightdeck$kanbanView$deleteColumnDialog$en.internal(_root);
}

// Path: flightdeck.dbPanel
class Translations$flightdeck$dbPanel$en {
	Translations$flightdeck$dbPanel$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'DATABASE'
	String get sectionDatabase => 'DATABASE';

	/// en: 'Edit…'
	String get edit => 'Edit…';

	/// en: 'Copy name'
	String get copyName => 'Copy name';

	/// en: 'New query'
	String get newQuery => 'New query';

	/// en: 'Browse keys'
	String get browseKeys => 'Browse keys';

	/// en: 'Delete connection'
	String get deleteConnectionTitle => 'Delete connection';

	/// en: 'Remove "${name}" from this workspace? Any saved password is discarded. .dbq files that reference it are not touched.'
	String deleteConnectionMessage({required Object name}) => 'Remove "${name}" from this workspace? Any saved password is discarded. .dbq files that reference it are not touched.';

	/// en: '.flightdeck/databases.json · ${n} connections'
	String footer({required Object n}) => '.flightdeck/databases.json · ${n} connections';

	/// en: '.flightdeck/databases.json · 1 connection'
	String get footerOne => '.flightdeck/databases.json · 1 connection';

	/// en: 'No connections yet.'
	String get noConnections => 'No connections yet.';

	/// en: 'Password not found on the host. Open this connection and enter it again — it is saved on the machine that runs the database, not on this one.'
	String get passwordRequired => 'Password not found on the host. Open this connection and enter it again — it is saved on the machine that runs the database, not on this one.';
}

// Path: flightdeck.dbMongoView
class Translations$flightdeck$dbMongoView$en {
	Translations$flightdeck$dbMongoView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete document'
	String get deleteDocumentTitle => 'Delete document';

	/// en: 'Delete the document with _id ${id} from "${collection}"?'
	String deleteDocumentMessage({required Object id, required Object collection}) => 'Delete the document with _id ${id} from "${collection}"?';

	/// en: 'Filter — JSON, e.g. {"status": "active"}'
	String get filterHint => 'Filter — JSON, e.g. {"status": "active"}';

	/// en: '(one) {1 doc} (other) {${n} docs}'
	String docCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 doc',
		other: '${n} docs',
	);

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Insert document'
	String get insertDocument => 'Insert document';

	/// en: 'No documents in this collection.'
	String get noDocuments => 'No documents in this collection.';

	/// en: 'No documents match this filter.'
	String get noDocumentsMatch => 'No documents match this filter.';

	/// en: 'Load more'
	String get loadMore => 'Load more';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Insert'
	String get insert => 'Insert';
}

// Path: flightdeck.dbConnectionDialog
class Translations$flightdeck$dbConnectionDialog$en {
	Translations$flightdeck$dbConnectionDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose SQLite database'
	String get chooseFileTitle => 'Choose SQLite database';

	/// en: 'File'
	String get file => 'File';

	/// en: 'Choose a SQLite file…'
	String get chooseFilePlaceholder => 'Choose a SQLite file…';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Save Password'
	String get savePassword => 'Save Password';

	/// en: 'Allow writes (agents)'
	String get allowWrites => 'Allow writes (agents)';

	/// en: 'off = agents can only read via CLI'
	String get allowWritesHint => 'off = agents can only read via CLI';

	/// en: 'Visible to agents'
	String get visibleToAgents => 'Visible to agents';

	/// en: 'off = hidden from the CLI, GUI only'
	String get visibleToAgentsHint => 'off = hidden from the CLI, GUI only';

	/// en: 'Testing connection…'
	String get testing => 'Testing connection…';

	/// en: 'Connection OK'
	String get connectionOk => 'Connection OK';

	/// en: 'Connection failed'
	String get connectionFailed => 'Connection failed';

	/// en: 'Edit connection'
	String get editTitle => 'Edit connection';

	/// en: 'New connection'
	String get newTitle => 'New connection';

	/// en: 'Connection string'
	String get connectionString => 'Connection string';

	/// en: 'Not a valid connection URL.'
	String get invalidUrl => 'Not a valid connection URL.';

	/// en: 'SSH Tunnel'
	String get sshTunnel => 'SSH Tunnel';

	/// en: 'SSH Host'
	String get sshHost => 'SSH Host';

	/// en: 'SSH Port'
	String get sshPort => 'SSH Port';

	/// en: 'SSH User'
	String get sshUser => 'SSH User';

	/// en: 'Private key'
	String get privateKey => 'Private key';

	/// en: 'Choose a private key…'
	String get choosePrivateKeyPlaceholder => 'Choose a private key…';

	/// en: 'Choose SSH private key'
	String get choosePrivateKeyDialogTitle => 'Choose SSH private key';

	/// en: 'Key passphrase'
	String get keyPassphrase => 'Key passphrase';

	/// en: 'Save passphrase'
	String get savePassphrase => 'Save passphrase';

	/// en: 'The password is stored on the host, not on this machine.'
	String get passwordOnHost => 'The password is stored on the host, not on this machine.';
}

// Path: flightdeck.sshPrompts
class Translations$flightdeck$sshPrompts$en {
	Translations$flightdeck$sshPrompts$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unknown SSH host'
	String get unknownSshHostTitle => 'Unknown SSH host';

	/// en: 'FlightDeck has never connected to ${endpoint} before.'
	String neverConnected({required Object endpoint}) => 'FlightDeck has never connected to ${endpoint} before.';

	/// en: 'Trust it only if this fingerprint matches the server. You can check it on the server with:'
	String get trustHint => 'Trust it only if this fingerprint matches the server. You can check it on the server with:';

	/// en: 'Trust'
	String get trust => 'Trust';

	/// en: 'SSH key passphrase'
	String get sshKeyPassphraseTitle => 'SSH key passphrase';

	/// en: 'Unlock ${keyPath} to connect "${connectionName}".'
	String unlockMessage({required Object keyPath, required Object connectionName}) => 'Unlock ${keyPath} to connect "${connectionName}".';

	/// en: 'Kept in memory until FlightDeck quits. To let agents use this connection, enable "Save passphrase" in the connection.'
	String get keptInMemoryHint => 'Kept in memory until FlightDeck quits. To let agents use this connection, enable "Save passphrase" in the connection.';

	/// en: 'Unlock'
	String get unlock => 'Unlock';
}

// Path: flightdeck.projectsRail
class Translations$flightdeck$projectsRail$en {
	Translations$flightdeck$projectsRail$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Workspaces'
	String get workspaces => 'Workspaces';

	/// en: 'New workspace'
	String get newWorkspace => 'New workspace';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Merge to Parent'
	String get mergeToParent => 'Merge to Parent';

	/// en: 'Update from Parent'
	String get updateFromParent => 'Update from Parent';

	/// en: 'Fork Worktree'
	String get forkWorktree => 'Fork Worktree';

	/// en: 'Copy branch'
	String get copyBranch => 'Copy branch';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Move to realm'
	String get moveToRealm => 'Move to realm';

	/// en: 'Copy workspace id'
	String get copyWorkspaceId => 'Copy workspace id';

	/// en: 'Rename'
	String get rename => 'Rename';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'New realm…'
	String get newRealm => 'New realm…';

	/// en: 'Manage realms…'
	String get manageRealms => 'Manage realms…';

	/// en: 'No workspaces yet.'
	String get noWorkspaces => 'No workspaces yet.';

	/// en: 'Sync'
	String get sync => 'Sync';

	/// en: 'Pull'
	String get pull => 'Pull';

	/// en: 'Push'
	String get push => 'Push';

	/// en: 'Create worktree'
	String get createWorktree => 'Create worktree';

	/// en: '(one) {1 worktree} (other) {${n} worktrees}'
	String worktreeCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 worktree',
		other: '${n} worktrees',
	);

	/// en: 'Expand worktrees'
	String get expandWorktrees => 'Expand worktrees';

	/// en: 'Collapse worktrees'
	String get collapseWorktrees => 'Collapse worktrees';
}

// Path: flightdeck.findBar
class Translations$flightdeck$findBar$en {
	Translations$flightdeck$findBar$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Find'
	String get find => 'Find';

	/// en: 'Match case'
	String get matchCase => 'Match case';

	/// en: 'Whole word'
	String get wholeWord => 'Whole word';

	/// en: 'Use regular expression'
	String get useRegex => 'Use regular expression';

	/// en: 'Previous (⇧⏎)'
	String get previous => 'Previous (⇧⏎)';

	/// en: 'Next (⏎)'
	String get next => 'Next (⏎)';

	/// en: 'Close (Esc)'
	String get close => 'Close (Esc)';

	/// en: 'Bad pattern'
	String get badPattern => 'Bad pattern';

	/// en: 'No results'
	String get noResults => 'No results';
}

// Path: flightdeck.contentSearch
class Translations$flightdeck$contentSearch$en {
	Translations$flightdeck$contentSearch$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'SEARCH'
	String get sectionSearch => 'SEARCH';

	/// en: 'Search in files'
	String get searchInFiles => 'Search in files';

	/// en: 'Match case'
	String get matchCase => 'Match case';

	/// en: 'Whole word'
	String get wholeWord => 'Whole word';

	/// en: 'Use regular expression'
	String get useRegex => 'Use regular expression';

	/// en: 'Invalid regular expression.'
	String get invalidRegex => 'Invalid regular expression.';

	/// en: 'Type to search across files.'
	String get typeToSearch => 'Type to search across files.';

	/// en: 'Searching…'
	String get searching => 'Searching…';

	/// en: 'No results.'
	String get noResults => 'No results.';
}

// Path: flightdeck.emptyPane
class Translations$flightdeck$emptyPane$en {
	Translations$flightdeck$emptyPane$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New agent'
	String get newAgent => 'New agent';

	/// en: 'Runs a pi in the folder you choose'
	String get newAgentDescription => 'Runs a pi in the folder you choose';

	/// en: 'New terminal'
	String get newTerminal => 'New terminal';

	/// en: 'Opens a shell in the folder you choose'
	String get newTerminalDescription => 'Opens a shell in the folder you choose';
}

// Path: flightdeck.topbar
class Translations$flightdeck$topbar$en {
	Translations$flightdeck$topbar$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Collapse sidebar'
	String get collapseSidebar => 'Collapse sidebar';

	/// en: 'Show/hide files'
	String get toggleFiles => 'Show/hide files';

	/// en: 'Files unavailable in FlightDeck'
	String get filesUnavailable => 'Files unavailable in FlightDeck';

	/// en: 'Hide keyboard'
	String get hideKeyboard => 'Hide keyboard';
}

// Path: flightdeck.transcript
class Translations$flightdeck$transcript$en {
	Translations$flightdeck$transcript$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Send'
	String get send => 'Send';

	/// en: 'Type your answer'
	String get typeYourAnswer => 'Type your answer';

	/// en: 'Send a prompt to get the agent started.'
	String get startHint => 'Send a prompt to get the agent started.';

	/// en: 'Worked for ${duration}'
	String workedFor({required Object duration}) => 'Worked for ${duration}';
}

// Path: flightdeck.tasks
class Translations$flightdeck$tasks$en {
	Translations$flightdeck$tasks$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hot reload'
	String get hotReload => 'Hot reload';

	/// en: 'Hot restart'
	String get hotRestart => 'Hot restart';

	/// en: 'Toggle debug paint'
	String get toggleDebugPaint => 'Toggle debug paint';

	/// en: 'Toggle platform'
	String get togglePlatform => 'Toggle platform';

	/// en: 'Quit'
	String get quit => 'Quit';
}

// Path: flightdeck.notifications
class Translations$flightdeck$notifications$en {
	Translations$flightdeck$notifications$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Agent finished'
	String get agentFinished => 'Agent finished';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Agent needs your input'
	String get agentNeedsAction => 'Agent needs your input';

	/// en: 'Agent stopped unexpectedly'
	String get agentCrashed => 'Agent stopped unexpectedly';
}

// Path: flightdeck.terminal
class Translations$flightdeck$terminal$en {
	Translations$flightdeck$terminal$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Warning: the folder "${requested}" does not exist. This terminal opened in "${path}".'
	String cwdFallbackWarning({required Object requested, required Object path}) => 'Warning: the folder "${requested}" does not exist. This terminal opened in "${path}".';
}

// Path: flightdeck.remoteHost
class Translations$flightdeck$remoteHost$en {
	Translations$flightdeck$remoteHost$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add remote host'
	String get addHost => 'Add remote host';

	/// en: 'Name'
	String get hostName => 'Name';

	/// en: 'SSH target (user@host)'
	String get sshTarget => 'SSH target (user@host)';

	/// en: 'Connecting to ${host}…'
	String connecting({required Object host}) => 'Connecting to ${host}…';

	/// en: 'SSH tunnel'
	String get openingTunnel => 'SSH tunnel';

	/// en: 'Installing server'
	String get installingServer => 'Installing server';

	/// en: 'Server ${version}'
	String handshake({required Object version}) => 'Server ${version}';

	/// en: 'Loading workspace…'
	String get loadingWorkspace => 'Loading workspace…';

	/// en: 'Reconnecting to ${host}…'
	String reconnecting({required Object host}) => 'Reconnecting to ${host}…';

	/// en: '${host} offline'
	String offline({required Object host}) => '${host} offline';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Reconnect'
	String get reconnect => 'Reconnect';

	/// en: 'Install server'
	String get installServer => 'Install server';

	/// en: 'Cannot reach ${host} over SSH. Is it on, and is Remote Login enabled?'
	String errSshUnreachable({required Object host}) => 'Cannot reach ${host} over SSH. Is it on, and is Remote Login enabled?';

	/// en: 'Could not install the server on ${host}.'
	String errInstallFailed({required Object host}) => 'Could not install the server on ${host}.';

	/// en: 'Server version incompatible; update it.'
	String get errVersionMismatch => 'Server version incompatible; update it.';

	/// en: 'Details: ${detail}'
	String errDetail({required Object detail}) => 'Details: ${detail}';

	/// en: 'Open folder on ${host}'
	String pickFolderTitle({required Object host}) => 'Open folder on ${host}';

	/// en: 'Open here'
	String get openHere => 'Open here';

	/// en: 'No subfolders'
	String get emptyFolder => 'No subfolders';

	/// en: 'Local'
	String get newLocal => 'Local';

	/// en: 'Remote'
	String get newRemote => 'Remote';

	/// en: 'Choose a host'
	String get chooseHost => 'Choose a host';

	/// en: 'New host…'
	String get newHostEntry => 'New host…';

	/// en: 'Edit host'
	String get editHost => 'Edit host';

	/// en: 'Username'
	String get userLabel => 'Username';

	/// en: 'Host / IP'
	String get hostLabel => 'Host / IP';

	/// en: 'Port'
	String get portLabel => 'Port';

	/// en: 'Authentication'
	String get authLabel => 'Authentication';

	/// en: 'SSH key'
	String get authKey => 'SSH key';

	/// en: 'Password'
	String get authPassword => 'Password';

	/// en: 'Password'
	String get passwordLabel => 'Password';

	/// en: 'Leave blank to keep current'
	String get passwordKeep => 'Leave blank to keep current';

	/// en: 'Username required'
	String get errUser => 'Username required';

	/// en: 'Host required'
	String get errHost => 'Host required';

	/// en: 'Password required'
	String get errPassword => 'Password required';

	/// en: 'Choose…'
	String get identityChoose => 'Choose…';

	/// en: 'No key selected'
	String get identityEmpty => 'No key selected';

	/// en: 'Select the SSH private key'
	String get identityDialogTitle => 'Select the SSH private key';

	/// en: 'Pick the private key to authenticate with.'
	String get errIdentity => 'Pick the private key to authenticate with.';

	/// en: 'FlightDeck does not trust ${host} yet. Connect again and confirm the fingerprint.'
	String errHostKeyUnknown({required Object host}) => 'FlightDeck does not trust ${host} yet. Connect again and confirm the fingerprint.';

	/// en: '${host} is presenting a different SSH key than the one stored. If you did not reinstall that machine, stop and check it — otherwise remove the old entry from ~/.ssh/known_hosts.'
	String errHostKeyChanged({required Object host}) => '${host} is presenting a different SSH key than the one stored. If you did not reinstall that machine, stop and check it — otherwise remove the old entry from ~/.ssh/known_hosts.';

	/// en: '${host} runs Windows but does not have FlightDeck installed. The remote server is installed from the FlightDeck bundle already on that machine, so install FlightDeck there and try again.'
	String errHostBundleMissing({required Object host}) => '${host} runs Windows but does not have FlightDeck installed. The remote server is installed from the FlightDeck bundle already on that machine, so install FlightDeck there and try again.';

	/// en: 'Could not identify the operating system of ${host}. The account may have a restricted shell, or no shell at all.'
	String errHostUnknownOs({required Object host}) => 'Could not identify the operating system of ${host}. The account may have a restricted shell, or no shell at all.';

	/// en: 'Only the public key is here. That works only if the private key is in your SSH agent; otherwise pick the private file (same name, without .pub).'
	String get errIdentityPublic => 'Only the public key is here. That works only if the private key is in your SSH agent; otherwise pick the private file (same name, without .pub).';

	/// en: 'That file does not look like a private key.'
	String get errIdentityNotKey => 'That file does not look like a private key.';

	/// en: 'That file no longer exists.'
	String get errIdentityMissingFile => 'That file no longer exists.';

	/// en: 'That file could not be read.'
	String get errIdentityUnreadable => 'That file could not be read.';
}

// Path: flightdeck.browserPane
class Translations$flightdeck$browserPane$en {
	Translations$flightdeck$browserPane$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Forward'
	String get forward => 'Forward';

	/// en: 'Reload'
	String get reload => 'Reload';

	/// en: 'Enter URL or address'
	String get urlHint => 'Enter URL or address';

	/// en: 'Go'
	String get go => 'Go';
}

// Path: flightdeck.gallery
class Translations$flightdeck$gallery$en {
	Translations$flightdeck$gallery$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Special FlightDeck documents that give you a visual of what the AI agent is doing.'
	String get intro => 'Special FlightDeck documents that give you a visual of what the AI agent is doing.';

	/// en: 'Could not create the file'
	String get createErrorTitle => 'Could not create the file';

	late final Translations$flightdeck$gallery$dbQuery$en dbQuery = Translations$flightdeck$gallery$dbQuery$en.internal(_root);
	late final Translations$flightdeck$gallery$kanban$en kanban = Translations$flightdeck$gallery$kanban$en.internal(_root);
	late final Translations$flightdeck$gallery$layout$en layout = Translations$flightdeck$gallery$layout$en.internal(_root);
	late final Translations$flightdeck$gallery$httpRequest$en httpRequest = Translations$flightdeck$gallery$httpRequest$en.internal(_root);
	late final Translations$flightdeck$gallery$html$en html = Translations$flightdeck$gallery$html$en.internal(_root);
	late final Translations$flightdeck$gallery$tasks$en tasks = Translations$flightdeck$gallery$tasks$en.internal(_root);
	late final Translations$flightdeck$gallery$notebook$en notebook = Translations$flightdeck$gallery$notebook$en.internal(_root);
}

// Path: flightdeck.notebook
class Translations$flightdeck$notebook$en {
	Translations$flightdeck$notebook$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notes'
	String get notes => 'Notes';

	/// en: 'New note'
	String get newNote => 'New note';

	/// en: 'Search notes'
	String get searchPlaceholder => 'Search notes';

	/// en: 'No notes yet. Create one, or ask the agent to write here.'
	String get empty => 'No notes yet. Create one, or ask the agent to write here.';

	/// en: 'No note matches.'
	String get noMatch => 'No note matches.';

	/// en: 'Select a note'
	String get selectNote => 'Select a note';

	/// en: 'Reload from disk'
	String get reload => 'Reload from disk';

	/// en: 'untagged'
	String get untagged => 'untagged';

	/// en: 'Could not save the note'
	String get saveFailed => 'Could not save the note';

	/// en: 'Could not create the note'
	String get createFailed => 'Could not create the note';

	/// en: 'add tag'
	String get addTag => 'add tag';

	/// en: 'Untitled'
	String get untitled => 'Untitled';

	/// en: 'Delete note'
	String get deleteNote => 'Delete note';

	/// en: 'Move “${name}” to the trash?'
	String deleteConfirm({required Object name}) => 'Move “${name}” to the trash?';

	/// en: 'Could not save the image'
	String get imageFailed => 'Could not save the image';

	late final Translations$flightdeck$notebook$format$en format = Translations$flightdeck$notebook$format$en.internal(_root);

	/// en: 'Linked from'
	String get backlinks => 'Linked from';

	/// en: 'Rename tag'
	String get renameTag => 'Rename tag';

	/// en: 'Delete tag'
	String get deleteTag => 'Delete tag';

	/// en: 'Remove “${name}” from ${count} notes? The notes stay.'
	String deleteTagConfirm({required Object name, required Object count}) => 'Remove “${name}” from ${count} notes? The notes stay.';

	/// en: 'Show notes list'
	String get showList => 'Show notes list';

	/// en: 'Hide notes list'
	String get hideList => 'Hide notes list';
}

// Path: settings.language
class Translations$settings$language$en {
	Translations$settings$language$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get title => 'Language';

	/// en: 'System'
	String get system => 'System';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Português (BR)'
	String get portugueseBr => 'Português (BR)';

	/// en: 'Español'
	String get spanish => 'Español';
}

// Path: settings.revokeDialog
class Translations$settings$revokeDialog$en {
	Translations$settings$revokeDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Device removed.'
	String get deviceRemoved => 'Device removed.';

	/// en: 'Failed to revoke the device.'
	String get failedToRevoke => 'Failed to revoke the device.';

	/// en: 'Revoking…'
	String get revoking => 'Revoking…';

	/// en: 'Revoking ${name}…'
	String revokingDevice({required Object name}) => 'Revoking ${name}…';

	/// en: 'Connecting to the relay and removing access.'
	String get connectingMessage => 'Connecting to the relay and removing access.';

	/// en: 'Ok'
	String get ok => 'Ok';
}

// Path: settings.pairingDialog
class Translations$settings$pairingDialog$en {
	Translations$settings$pairingDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pair device'
	String get title => 'Pair device';

	/// en: 'Connecting to the relay…'
	String get connectingToRelay => 'Connecting to the relay…';

	/// en: 'Open the Remote Pi app on your phone.'
	String get step1 => 'Open the Remote Pi app on your phone.';

	/// en: 'Tap add / pair device.'
	String get step2 => 'Tap add / pair device.';

	/// en: 'Point the camera at the QR below.'
	String get step3 => 'Point the camera at the QR below.';

	/// en: 'Could not generate the QR.'
	String get qrGenerationFailed => 'Could not generate the QR.';

	/// en: 'The code refreshes on its own. Keep this window open.'
	String get autoRefreshHint => 'The code refreshes on its own. Keep this window open.';

	/// en: 'Pairing failed.'
	String get pairingFailed => 'Pairing failed.';

	/// en: 'Try again'
	String get tryAgain => 'Try again';

	/// en: 'Copied!'
	String get copied => 'Copied!';

	/// en: 'Copy data'
	String get copyData => 'Copy data';
}

// Path: settings.page
class Translations$settings$page$en {
	Translations$settings$page$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$settings$page$header$en header = Translations$settings$page$header$en.internal(_root);
	late final Translations$settings$page$nav$en nav = Translations$settings$page$nav$en.internal(_root);
	late final Translations$settings$page$general$en general = Translations$settings$page$general$en.internal(_root);
	late final Translations$settings$page$diagnostics$en diagnostics = Translations$settings$page$diagnostics$en.internal(_root);
	late final Translations$settings$page$storage$en storage = Translations$settings$page$storage$en.internal(_root);
	late final Translations$settings$page$terminal$en terminal = Translations$settings$page$terminal$en.internal(_root);
	late final Translations$settings$page$appearance$en appearance = Translations$settings$page$appearance$en.internal(_root);
	late final Translations$settings$page$notifications$en notifications = Translations$settings$page$notifications$en.internal(_root);
	late final Translations$settings$page$shortcuts$en shortcuts = Translations$settings$page$shortcuts$en.internal(_root);
	late final Translations$settings$page$languages$en languages = Translations$settings$page$languages$en.internal(_root);
	late final Translations$settings$page$connectivity$en connectivity = Translations$settings$page$connectivity$en.internal(_root);
	late final Translations$settings$page$schedules$en schedules = Translations$settings$page$schedules$en.internal(_root);
	late final Translations$settings$page$daemons$en daemons = Translations$settings$page$daemons$en.internal(_root);
	late final Translations$settings$page$automations$en automations = Translations$settings$page$automations$en.internal(_root);
}

// Path: settings.remoteHosts
class Translations$settings$remoteHosts$en {
	Translations$settings$remoteHosts$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Remote hosts'
	String get title => 'Remote hosts';

	/// en: 'Machines you reach over SSH. Adding a host here is the same as adding one from the workspace "+" menu.'
	String get description => 'Machines you reach over SSH. Adding a host here is the same as adding one from the workspace "+" menu.';

	/// en: 'No remote hosts yet.'
	String get empty => 'No remote hosts yet.';

	/// en: 'Add host'
	String get add => 'Add host';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Reconnect'
	String get reconnect => 'Reconnect';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Remove host'
	String get removeTitle => 'Remove host';

	/// en: 'Remove "${name}" and all its workspaces? Nothing is deleted on the host itself.'
	String removeMessage({required Object name}) => 'Remove "${name}" and all its workspaces? Nothing is deleted on the host itself.';

	/// en: '${count} workspace(s)'
	String workspacesCount({required Object count}) => '${count} workspace(s)';

	/// en: 'This device's key'
	String get deviceKeyTitle => 'This device\'s key';

	/// en: 'Add this public key to ~/.ssh/authorized_keys on the host so this device can connect.'
	String get deviceKeyDesc => 'Add this public key to ~/.ssh/authorized_keys on the host so this device can connect.';

	/// en: 'Copy public key'
	String get deviceKeyCopy => 'Copy public key';

	/// en: 'Public key copied'
	String get deviceKeyCopied => 'Public key copied';

	/// en: 'Connected'
	String get statusConnected => 'Connected';

	/// en: 'Connecting…'
	String get statusConnecting => 'Connecting…';

	/// en: 'Reconnecting…'
	String get statusReconnecting => 'Reconnecting…';

	/// en: 'Offline'
	String get statusOffline => 'Offline';

	/// en: 'Not connected'
	String get statusIdle => 'Not connected';

	/// en: 'How it works'
	String get helpTitle => 'How it works';

	/// en: 'FlightDeck connects to your machine over SSH and talks to a small server that runs the terminals, files and git there. The host must have FlightDeck (desktop) or the flightdeck-server installed and running, and this device’s public key added to its ~/.ssh/authorized_keys.'
	String get helpBody => 'FlightDeck connects to your machine over SSH and talks to a small server that runs the terminals, files and git there. The host must have FlightDeck (desktop) or the flightdeck-server installed and running, and this device’s public key added to its ~/.ssh/authorized_keys.';
}

// Path: automation.error
class Translations$automation$error$en {
	Translations$automation$error$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '${harness} is not installed or is not on PATH.'
	String unavailable({required Object harness}) => '${harness} is not installed or is not on PATH.';

	/// en: 'Model "${model}" is not available for ${harness}. Choose another model in Settings.'
	String modelUnavailable({required Object model, required Object harness}) => 'Model "${model}" is not available for ${harness}. Choose another model in Settings.';

	/// en: '${harness}: ${detail}'
	String authentication({required Object harness, required Object detail}) => '${harness}: ${detail}';

	/// en: '${harness} did not respond within ${seconds} seconds.'
	String timeout({required Object harness, required Object seconds}) => '${harness} did not respond within ${seconds} seconds.';

	/// en: 'Commit message generation was cancelled.'
	String get cancelled => 'Commit message generation was cancelled.';

	/// en: '${harness}: ${detail}'
	String process({required Object harness, required Object detail}) => '${harness}: ${detail}';

	/// en: '${harness} could not generate a commit message.'
	String processNoDetail({required Object harness}) => '${harness} could not generate a commit message.';

	/// en: 'The automation returned an empty commit message.'
	String get invalidResponse => 'The automation returned an empty commit message.';

	/// en: 'Another commit message is already being generated.'
	String get busy => 'Another commit message is already being generated.';

	/// en: 'The automation could not generate a commit message.'
	String get unknown => 'The automation could not generate a commit message.';

	/// en: 'No workspace selected.'
	String get noWorkspace => 'No workspace selected.';

	/// en: 'File is outside the workspace roots.'
	String get fileOutsideWorkspace => 'File is outside the workspace roots.';

	/// en: 'Could not read the file: ${detail}'
	String fileUnreadable({required Object detail}) => 'Could not read the file: ${detail}';

	/// en: 'A commit message cannot be generated for a binary file.'
	String get binaryFile => 'A commit message cannot be generated for a binary file.';

	/// en: 'There are no changes to describe for this file.'
	String get noFileChanges => 'There are no changes to describe for this file.';

	/// en: 'There are no staged changes to describe.'
	String get noStagedChanges => 'There are no staged changes to describe.';

	/// en: 'Staged changes belong to multiple repositories. Generate them separately.'
	String get multipleRepositories => 'Staged changes belong to multiple repositories. Generate them separately.';

	/// en: 'Could not read the diff.'
	String get diffUnavailable => 'Could not read the diff.';

	/// en: 'Configure a commit message harness in Settings.'
	String get notConfigured => 'Configure a commit message harness in Settings.';
}

// Path: fileOperation.error
class Translations$fileOperation$error$en {
	Translations$fileOperation$error$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Already exists: “${name}”.'
	String alreadyExists({required Object name}) => 'Already exists: “${name}”.';

	/// en: 'Not found: “${name}”.'
	String notFound({required Object name}) => 'Not found: “${name}”.';

	/// en: 'Invalid path.'
	String get invalidPath => 'Invalid path.';

	/// en: 'The name cannot be empty.'
	String get emptyName => 'The name cannot be empty.';

	/// en: 'No workspace selected.'
	String get noWorkspace => 'No workspace selected.';

	/// en: 'Cannot move a folder into itself.'
	String get cannotMoveIntoItself => 'Cannot move a folder into itself.';

	/// en: 'Clipboard is empty.'
	String get clipboardEmpty => 'Clipboard is empty.';

	/// en: 'This tab is not a scratch file.'
	String get notScratchTab => 'This tab is not a scratch file.';

	/// en: 'Could not write the file.'
	String get writeFailed => 'Could not write the file.';

	/// en: 'Empty formatter command.'
	String get formatterEmptyCommand => 'Empty formatter command.';

	/// en: 'Formatter command must include the %FILE% placeholder.'
	String get formatterMissingPlaceholder => 'Formatter command must include the %FILE% placeholder.';

	/// en: 'Formatter timed out.'
	String get formatterTimeout => 'Formatter timed out.';

	/// en: 'Formatter exited with ${code}.'
	String formatterExitCode({required Object code}) => 'Formatter exited with ${code}.';

	/// en: 'The formatter could not run.'
	String get formatterFailed => 'The formatter could not run.';

	/// en: '${detail}'
	String osFailure({required Object detail}) => '${detail}';

	/// en: 'Name cannot contain “/”.'
	String get nameHasSlash => 'Name cannot contain “/”.';

	/// en: 'Invalid name.'
	String get invalidName => 'Invalid name.';
}

// Path: theme.error
class Translations$theme$error$en {
	Translations$theme$error$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Could not read or write the theme file.'
	String get io => 'Could not read or write the theme file.';

	/// en: 'Could not read or write the theme file: ${detail}'
	String ioDetail({required Object detail}) => 'Could not read or write the theme file: ${detail}';

	/// en: 'This file is not valid JSON: ${detail}'
	String malformedJson({required Object detail}) => 'This file is not valid JSON: ${detail}';

	/// en: 'This file is not a valid theme.'
	String get invalidTheme => 'This file is not a valid theme.';

	/// en: 'This theme uses the id of a built-in theme. Change "id" in the file and import again.'
	String get reservedId => 'This theme uses the id of a built-in theme. Change "id" in the file and import again.';

	/// en: 'Expected an object at "${field}".'
	String notAnObject({required Object field}) => 'Expected an object at "${field}".';

	/// en: 'Missing required field "${field}".'
	String missingField({required Object field}) => 'Missing required field "${field}".';

	/// en: '"${value}" at "${field}" is not a color. Use #RGB, #RRGGBB or #RRGGBBAA.'
	String badColor({required Object value, required Object field}) => '"${value}" at "${field}" is not a color. Use #RGB, #RRGGBB or #RRGGBBAA.';

	/// en: 'Unknown base theme "${value}" in "extends".'
	String unknownBase({required Object value}) => 'Unknown base theme "${value}" in "extends".';

	/// en: 'The theme declares no variant. Add "dark", "light" or both under "variants".'
	String get noVariants => 'The theme declares no variant. Add "dark", "light" or both under "variants".';
}

// Path: flightdeck.httpView.error
class Translations$flightdeck$httpView$error$en {
	Translations$flightdeck$httpView$error$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request failed'
	String get title => 'Request failed';

	/// en: 'No request found at the cursor.'
	String get noRequest => 'No request found at the cursor.';

	/// en: 'Invalid URL: ${url}'
	String invalidUrl({required Object url}) => 'Invalid URL: ${url}';

	/// en: 'Variable {{${name}}} has no value. Declare it with @${name} = … in this file.'
	String unresolvedVariable({required Object name}) => 'Variable {{${name}}} has no value. Declare it with @${name} = … in this file.';

	/// en: 'Body file not found: ${path}'
	String bodyFileMissing({required Object path}) => 'Body file not found: ${path}';

	/// en: 'Could not read the body file ${path}: ${detail}'
	String bodyFileUnreadable({required Object path, required Object detail}) => 'Could not read the body file ${path}: ${detail}';

	/// en: 'Could not reach the server: ${detail}'
	String connectionFailed({required Object detail}) => 'Could not reach the server: ${detail}';

	/// en: 'Could not reach the server.'
	String get connectionFailedNoDetail => 'Could not reach the server.';

	/// en: 'The request timed out after ${seconds}s.'
	String timeout({required Object seconds}) => 'The request timed out after ${seconds}s.';

	/// en: 'The response is larger than the ${bytes} byte limit.'
	String responseTooLarge({required Object bytes}) => 'The response is larger than the ${bytes} byte limit.';
}

// Path: flightdeck.kanbanView.deleteColumnDialog
class Translations$flightdeck$kanbanView$deleteColumnDialog$en {
	Translations$flightdeck$kanbanView$deleteColumnDialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete “${name}”?'
	String title({required Object name}) => 'Delete “${name}”?';

	/// en: 'This column has ${count}. Choose what happens to them.'
	String message({required Object count}) => 'This column has ${count}. Choose what happens to them.';

	/// en: 'Move to the previous column'
	String get moveCards => 'Move to the previous column';

	/// en: 'Delete with the column'
	String get deleteAll => 'Delete with the column';

	/// en: 'This column is empty.'
	String get emptyMessage => 'This column is empty.';
}

// Path: flightdeck.gallery.dbQuery
class Translations$flightdeck$gallery$dbQuery$en {
	Translations$flightdeck$gallery$dbQuery$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Database query'
	String get title => 'Database query';

	/// en: 'SQL editor with a result grid, using one of the registered connections.'
	String get description => 'SQL editor with a result grid, using one of the registered connections.';
}

// Path: flightdeck.gallery.kanban
class Translations$flightdeck$gallery$kanban$en {
	Translations$flightdeck$gallery$kanban$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Kanban board'
	String get title => 'Kanban board';

	/// en: 'Columns and cards stored as plain markdown. Drag, edit and comment.'
	String get description => 'Columns and cards stored as plain markdown. Drag, edit and comment.';
}

// Path: flightdeck.gallery.layout
class Translations$flightdeck$gallery$layout$en {
	Translations$flightdeck$gallery$layout$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pane layout'
	String get title => 'Pane layout';

	/// en: 'Terminals and splits to open in one go, like tmuxinator. Can run automatically on new worktrees.'
	String get description => 'Terminals and splits to open in one go, like tmuxinator. Can run automatically on new worktrees.';
}

// Path: flightdeck.gallery.httpRequest
class Translations$flightdeck$gallery$httpRequest$en {
	Translations$flightdeck$gallery$httpRequest$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'HTTP requests'
	String get title => 'HTTP requests';

	/// en: 'Write requests in a file and run them with the response next to it.'
	String get description => 'Write requests in a file and run them with the response next to it.';
}

// Path: flightdeck.gallery.html
class Translations$flightdeck$gallery$html$en {
	Translations$flightdeck$gallery$html$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'HTML view'
	String get title => 'HTML view';

	/// en: 'A page the agent writes and FlightDeck renders directly: mind maps, diagrams, charts, whatever you need.'
	String get description => 'A page the agent writes and FlightDeck renders directly: mind maps, diagrams, charts, whatever you need.';
}

// Path: flightdeck.gallery.tasks
class Translations$flightdeck$gallery$tasks$en {
	Translations$flightdeck$gallery$tasks$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tasks'
	String get title => 'Tasks';

	/// en: 'Commands to run from the Tasks panel, such as the dev server, tests and build. Stored in .flightdeck/tasks.json.'
	String get description => 'Commands to run from the Tasks panel, such as the dev server, tests and build. Stored in .flightdeck/tasks.json.';
}

// Path: flightdeck.gallery.notebook
class Translations$flightdeck$gallery$notebook$en {
	Translations$flightdeck$gallery$notebook$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notebook'
	String get title => 'Notebook';

	/// en: 'A folder of short notes with tags. The agent writes, you read and edit. Also opens in Obsidian.'
	String get description => 'A folder of short notes with tags. The agent writes, you read and edit. Also opens in Obsidian.';
}

// Path: flightdeck.notebook.format
class Translations$flightdeck$notebook$format$en {
	Translations$flightdeck$notebook$format$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Bold (⌘B)'
	String get bold => 'Bold (⌘B)';

	/// en: 'Italic (⌘I)'
	String get italic => 'Italic (⌘I)';

	/// en: 'Strikethrough'
	String get strike => 'Strikethrough';

	/// en: 'Heading 1'
	String get heading1 => 'Heading 1';

	/// en: 'Heading 2'
	String get heading2 => 'Heading 2';

	/// en: 'Heading 3'
	String get heading3 => 'Heading 3';

	/// en: 'Bullet list'
	String get bullets => 'Bullet list';

	/// en: 'Numbered list'
	String get numbered => 'Numbered list';

	/// en: 'Checklist'
	String get checklist => 'Checklist';

	/// en: 'Quote'
	String get quote => 'Quote';

	/// en: 'Inline code (⌘E)'
	String get code => 'Inline code (⌘E)';

	/// en: 'Code block'
	String get codeBlock => 'Code block';

	/// en: 'Link (⌘K)'
	String get link => 'Link (⌘K)';

	/// en: 'Divider'
	String get rule => 'Divider';

	/// en: 'Link to a note ([[…]])'
	String get noteLink => 'Link to a note ([[…]])';

	/// en: 'Search notes'
	String get noteLinkSearch => 'Search notes';

	/// en: 'Insert image…'
	String get image => 'Insert image…';
}

// Path: settings.page.header
class Translations$settings$page$header$en {
	Translations$settings$page$header$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Settings'
	String get title => 'Settings';
}

// Path: settings.page.nav
class Translations$settings$page$nav$en {
	Translations$settings$page$nav$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'General'
	String get general => 'General';

	/// en: 'Appearance'
	String get appearance => 'Appearance';

	/// en: 'Terminal'
	String get terminal => 'Terminal';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Shortcuts'
	String get shortcuts => 'Shortcuts';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Connectivity'
	String get connectivity => 'Connectivity';

	/// en: 'Daemon Agents'
	String get daemonAgents => 'Daemon Agents';

	/// en: 'Schedules'
	String get schedules => 'Schedules';

	/// en: 'Automations'
	String get automations => 'Automations';

	/// en: 'Remote hosts'
	String get remoteHosts => 'Remote hosts';
}

// Path: settings.page.general
class Translations$settings$page$general$en {
	Translations$settings$page$general$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Agent'
	String get sectionAgent => 'Agent';

	/// en: 'Enable agents'
	String get enableAgentsTitle => 'Enable agents';

	/// en: 'Show the option to open agent tabs (pi). When off, FlightDeck works as a terminal-only workspace.'
	String get enableAgentsDesc => 'Show the option to open agent tabs (pi). When off, FlightDeck works as a terminal-only workspace.';

	/// en: 'Show FlightDeck terminal'
	String get showFlightDeckTitle => 'Show FlightDeck terminal';

	/// en: 'Keep a pathless, terminal-only workspace pinned at the top of the rail. Turning it off closes its terminals.'
	String get showFlightDeckDesc => 'Keep a pathless, terminal-only workspace pinned at the top of the rail. Turning it off closes its terminals.';

	/// en: 'Launch at login'
	String get launchAtStartupTitle => 'Launch at login';

	/// en: 'Start FlightDeck automatically when you sign in to your computer.'
	String get launchAtStartupDesc => 'Start FlightDeck automatically when you sign in to your computer.';

	/// en: 'Updates'
	String get sectionUpdates => 'Updates';

	/// en: 'Check for updates'
	String get checkUpdatesTitle => 'Check for updates';

	/// en: 'How often FlightDeck should look for new versions.'
	String get checkUpdatesDesc => 'How often FlightDeck should look for new versions.';

	/// en: 'Can't turn agents off while an agent tab is open. Close all agent tabs first, then disable it.'
	String get agentsInUseError => 'Can\'t turn agents off while an agent tab is open. Close all agent tabs first, then disable it.';

	late final Translations$settings$page$general$updateFrequency$en updateFrequency = Translations$settings$page$general$updateFrequency$en.internal(_root);
}

// Path: settings.page.diagnostics
class Translations$settings$page$diagnostics$en {
	Translations$settings$page$diagnostics$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Diagnostics'
	String get sectionTitle => 'Diagnostics';

	/// en: 'Log file'
	String get logFileTitle => 'Log file';

	/// en: 'Errors and startup events are recorded here, kept for ${days} days. ${path}'
	String logFileDesc({required Object days, required Object path}) => 'Errors and startup events are recorded here, kept for ${days} days.\n${path}';

	/// en: 'unavailable'
	String get unavailable => 'unavailable';

	/// en: 'Reveal'
	String get reveal => 'Reveal';

	/// en: 'Report a problem'
	String get reportTitle => 'Report a problem';

	/// en: 'Opens a pre-filled issue with your version, OS and recent log. Nothing is sent automatically — you review it first.'
	String get reportDesc => 'Opens a pre-filled issue with your version, OS and recent log. Nothing is sent automatically — you review it first.';

	/// en: 'Report…'
	String get reportButton => 'Report…';

	/// en: 'Problem report'
	String get reportDialogTitle => 'Problem report';

	/// en: 'Reported manually from Settings.'
	String get reportDialogError => 'Reported manually from Settings.';

	/// en: 'Describe what went wrong in the issue. The recent log is included below and in "Copy details".'
	String get reportDialogDescription => 'Describe what went wrong in the issue. The recent log is included below and in "Copy details".';
}

// Path: settings.page.storage
class Translations$settings$page$storage$en {
	Translations$settings$page$storage$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Storage'
	String get sectionTitle => 'Storage';

	/// en: 'Storage location'
	String get locationTitle => 'Storage location';

	/// en: 'FlightDeck keeps its projects, layouts and settings here. Point it at a synced folder to back it up. ${root}'
	String locationDesc({required Object root}) => 'FlightDeck keeps its projects, layouts and settings here. Point it at a synced folder to back it up.\n${root}';

	/// en: 'Use default'
	String get useDefault => 'Use default';

	/// en: 'Working…'
	String get working => 'Working…';

	/// en: 'Change…'
	String get change => 'Change…';

	/// en: 'Reset FlightDeck'
	String get resetTitle => 'Reset FlightDeck';

	/// en: 'Delete all local data — projects, layouts, settings and terminal history — and return to the default location.'
	String get resetDesc => 'Delete all local data — projects, layouts, settings and terminal history — and return to the default location.';

	/// en: 'Reset…'
	String get resetButton => 'Reset…';

	/// en: 'Reset'
	String get resetConfirm => 'Reset';

	/// en: 'Reset FlightDeck?'
	String get resetDialogTitle => 'Reset FlightDeck?';

	/// en: 'This permanently deletes all local FlightDeck data — projects, layouts, settings and terminal history. This cannot be undone. FlightDeck will close so you can start fresh.'
	String get resetDialogContent => 'This permanently deletes all local FlightDeck data — projects, layouts, settings and terminal history. This cannot be undone. FlightDeck will close so you can start fresh.';

	/// en: 'Restart required'
	String get restartRequiredTitle => 'Restart required';

	/// en: 'FlightDeck will use this folder from the next launch: ${path}'
	String restartChangeFolderMessage({required Object path}) => 'FlightDeck will use this folder from the next launch:\n${path}';

	/// en: 'FlightDeck will use the default system location from the next launch. Your data in the custom folder is left untouched.'
	String get restartUseDefaultMessage => 'FlightDeck will use the default system location from the next launch. Your data in the custom folder is left untouched.';

	/// en: 'All FlightDeck data was cleared. Restart to start fresh.'
	String get restartResetMessage => 'All FlightDeck data was cleared. Restart to start fresh.';

	/// en: 'Later'
	String get later => 'Later';

	/// en: 'Quit FlightDeck'
	String get quitFlightDeck => 'Quit FlightDeck';

	/// en: 'Choose a folder for FlightDeck data'
	String get chooseFolderDialogTitle => 'Choose a folder for FlightDeck data';
}

// Path: settings.page.terminal
class Translations$settings$page$terminal$en {
	Translations$settings$page$terminal$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Default terminal'
	String get sectionDefaultTerminal => 'Default terminal';

	/// en: 'Engine'
	String get engineTitle => 'Engine';

	/// en: 'Used by new terminal tabs and task output buffers. Open tabs keep their current engine.'
	String get engineDesc => 'Used by new terminal tabs and task output buffers. Open tabs keep their current engine.';

	/// en: 'Shell'
	String get shellTitle => 'Shell';

	/// en: 'Which shell new terminal tabs open. The arrow next to + still opens any other one, just for that tab.'
	String get shellDesc => 'Which shell new terminal tabs open. The arrow next to + still opens any other one, just for that tab.';

	/// en: 'No WSL distros found. Install one (wsl.exe --install) and restart FlightDeck to see it listed here.'
	String get noWslMessage => 'No WSL distros found. Install one (wsl.exe --install) and restart FlightDeck to see it listed here.';
}

// Path: settings.page.appearance
class Translations$settings$page$appearance$en {
	Translations$settings$page$appearance$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Theme'
	String get sectionTheme => 'Theme';

	/// en: 'Theme'
	String get themeTitle => 'Theme';

	/// en: 'App colors, code highlighting and terminal palette.'
	String get themeDesc => 'App colors, code highlighting and terminal palette.';

	/// en: 'Mode'
	String get modeTitle => 'Mode';

	/// en: 'Which variant of the theme to use.'
	String get modeDesc => 'Which variant of the theme to use.';

	/// en: '"${theme}" only ships a dark variant, so this has no effect.'
	String modeOnlyDark({required Object theme}) => '"${theme}" only ships a dark variant, so this has no effect.';

	/// en: '"${theme}" only ships a light variant, so this has no effect.'
	String modeOnlyLight({required Object theme}) => '"${theme}" only ships a light variant, so this has no effect.';

	/// en: 'Theme file'
	String get themeFileTitle => 'Theme file';

	/// en: 'Import a theme from a JSON file, or export the active one.'
	String get themeFileDesc => 'Import a theme from a JSON file, or export the active one.';

	/// en: 'Code'
	String get previewCode => 'Code';

	/// en: 'Terminal'
	String get previewTerminal => 'Terminal';

	/// en: 'System'
	String get themeSystem => 'System';

	/// en: 'Light'
	String get themeLight => 'Light';

	/// en: 'Dark'
	String get themeDark => 'Dark';

	/// en: 'Fonts'
	String get sectionFonts => 'Fonts';

	/// en: 'Interface font'
	String get interfaceFontTitle => 'Interface font';

	/// en: 'Used across the whole app. Empty = system default.'
	String get interfaceFontDesc => 'Used across the whole app. Empty = system default.';

	/// en: 'Interface size'
	String get interfaceSizeTitle => 'Interface size';

	/// en: 'Code font'
	String get codeFontTitle => 'Code font';

	/// en: 'Code and diffs. Empty = system default.'
	String get codeFontDesc => 'Code and diffs. Empty = system default.';

	/// en: 'Code size'
	String get codeSizeTitle => 'Code size';

	/// en: 'Terminal font'
	String get terminalFontTitle => 'Terminal font';

	/// en: 'Terminal only. Empty = system default.'
	String get terminalFontDesc => 'Terminal only. Empty = system default.';

	/// en: 'Terminal size'
	String get terminalSizeTitle => 'Terminal size';

	/// en: 'Off = follows the code size.'
	String get terminalSizeDesc => 'Off = follows the code size.';

	/// en: 'Follow code size'
	String get terminalSizeInherit => 'Follow code size';

	/// en: 'Terminal weight'
	String get terminalWeightTitle => 'Terminal weight';

	/// en: 'Low-density screens render strokes heavier. Auto lightens them there and leaves Retina untouched.'
	String get terminalWeightDesc => 'Low-density screens render strokes heavier. Auto lightens them there and leaves Retina untouched.';

	/// en: 'Auto (by screen)'
	String get terminalWeightAuto => 'Auto (by screen)';

	/// en: 'Light'
	String get terminalWeightLight => 'Light';

	/// en: 'Normal'
	String get terminalWeightNormal => 'Normal';

	/// en: 'Medium'
	String get terminalWeightMedium => 'Medium';

	/// en: 'Semibold'
	String get terminalWeightSemiBold => 'Semibold';

	/// en: 'Conversation'
	String get sectionConversation => 'Conversation';

	/// en: 'Pin user message'
	String get pinUserMessageTitle => 'Pin user message';

	/// en: 'The question stays fixed at the top while the answer scrolls.'
	String get pinUserMessageDesc => 'The question stays fixed at the top while the answer scrolls.';

	/// en: 'Import…'
	String get importTheme => 'Import…';

	/// en: 'Export…'
	String get exportTheme => 'Export…';

	/// en: 'Remove'
	String get deleteTheme => 'Remove';

	/// en: 'Pick a theme file'
	String get importThemeDialog => 'Pick a theme file';

	/// en: 'Save theme as'
	String get exportThemeDialog => 'Save theme as';

	/// en: 'Theme "${name}" imported.'
	String themeImported({required Object name}) => 'Theme "${name}" imported.';

	/// en: 'Theme saved.'
	String get themeExported => 'Theme saved.';

	/// en: 'Theme removed.'
	String get themeDeleted => 'Theme removed.';

	/// en: 'Choose a font'
	String get fontPickerTitle => 'Choose a font';

	/// en: 'Search fonts'
	String get fontPickerSearch => 'Search fonts';

	/// en: 'No matching font found on this machine.'
	String get fontPickerEmpty => 'No matching font found on this machine.';

	/// en: 'included'
	String get fontPickerBundled => 'included';

	/// en: 'Not listed? Type the exact family name.'
	String get fontPickerCustom => 'Not listed? Type the exact family name.';

	/// en: 'Family name'
	String get fontPickerCustomHint => 'Family name';

	/// en: 'Use'
	String get fontPickerUse => 'Use';

	/// en: 'Default'
	String get fontPickerDefault => 'Default';

	/// en: 'Not found on this machine — falling back.'
	String get fontMissing => 'Not found on this machine — falling back.';

	/// en: 'Layout'
	String get sectionLayout => 'Layout';

	/// en: 'Swap side panels'
	String get swapPanelsTitle => 'Swap side panels';

	/// en: 'Puts workspaces on the right and files, search, git and database on the left.'
	String get swapPanelsDesc => 'Puts workspaces on the right and files, search, git and database on the left.';
}

// Path: settings.page.notifications
class Translations$settings$page$notifications$en {
	Translations$settings$page$notifications$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notifications'
	String get sectionTitle => 'Notifications';

	/// en: 'Enable notifications'
	String get enableTitle => 'Enable notifications';

	/// en: 'Alert me when an agent finishes a turn and the window is not focused.'
	String get enableDesc => 'Alert me when an agent finishes a turn and the window is not focused.';

	/// en: 'System permission'
	String get systemPermissionTitle => 'System permission';

	/// en: 'FlightDeck is allowed to send notifications.'
	String get grantedDesc => 'FlightDeck is allowed to send notifications.';

	/// en: 'macOS has not granted notification access yet.'
	String get notGrantedDesc => 'macOS has not granted notification access yet.';

	/// en: 'Granted'
	String get granted => 'Granted';

	/// en: 'Request permission'
	String get requestPermission => 'Request permission';

	/// en: 'Sounds'
	String get soundsTitle => 'Sounds';

	/// en: 'Volume'
	String get soundVolumeTitle => 'Volume';

	/// en: 'Turn completed'
	String get soundTurnDone => 'Turn completed';

	/// en: 'An agent finished its turn.'
	String get soundTurnDoneDesc => 'An agent finished its turn.';

	/// en: 'Action required'
	String get soundActionRequired => 'Action required';

	/// en: 'An agent is waiting for your approval or answer.'
	String get soundActionRequiredDesc => 'An agent is waiting for your approval or answer.';

	/// en: 'Agent error'
	String get soundAgentError => 'Agent error';

	/// en: 'An agent process stopped unexpectedly.'
	String get soundAgentErrorDesc => 'An agent process stopped unexpectedly.';

	/// en: 'Default'
	String get soundDefault => 'Default';

	/// en: 'Custom: ${name}'
	String soundCustom({required Object name}) => 'Custom: ${name}';

	/// en: 'Choose file'
	String get soundChooseFile => 'Choose file';

	/// en: 'Reset to default'
	String get soundReset => 'Reset to default';

	/// en: 'Also play when this tab is active'
	String get soundOnActiveTab => 'Also play when this tab is active';

	/// en: 'Preview'
	String get soundPreview => 'Preview';
}

// Path: settings.page.shortcuts
class Translations$settings$page$shortcuts$en {
	Translations$settings$page$shortcuts$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Keyboard shortcuts are not customizable yet.'
	String get notCustomizable => 'Keyboard shortcuts are not customizable yet.';
}

// Path: settings.page.languages
class Translations$settings$page$languages$en {
	Translations$settings$page$languages$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'FORMATTING'
	String get sectionFormatting => 'FORMATTING';

	/// en: 'Format on save'
	String get formatOnSaveTitle => 'Format on save';

	/// en: 'Format the file automatically when you save (⌘S).'
	String get formatOnSaveDesc => 'Format the file automatically when you save (⌘S).';

	/// en: 'LANGUAGE SERVERS'
	String get sectionLanguageServers => 'LANGUAGE SERVERS';

	/// en: 'Errors and formatting use each language's language server. FlightDeck does not install servers — it uses what is already on your machine. ● responds · ○ not found or invalid command (install the server or adjust the command).'
	String get footerNote => 'Errors and formatting use each language\'s language server. FlightDeck does not install servers — it uses what is already on your machine. ● responds · ○ not found or invalid command (install the server or adjust the command).';

	/// en: 'Language server command'
	String get serverCommandLabel => 'Language server command';

	/// en: 'Formatter command (optional)'
	String get formatterCommandLabel => 'Formatter command (optional)';

	/// en: 'External formatter with %FILE% placeholder. Takes precedence over the LSP formatter when set.'
	String get formatterHint => 'External formatter with %FILE% placeholder. Takes precedence over the LSP formatter when set.';

	/// en: 'Reset to default'
	String get resetToDefault => 'Reset to default';

	/// en: 'Save & restart'
	String get saveAndRestart => 'Save & restart';

	/// en: 'Server responds'
	String get statusResponds => 'Server responds';

	/// en: 'Server not found or command invalid'
	String get statusNotFound => 'Server not found or command invalid';
}

// Path: settings.page.connectivity
class Translations$settings$page$connectivity$en {
	Translations$settings$page$connectivity$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Relay'
	String get sectionRelay => 'Relay';

	/// en: 'Paired devices'
	String get sectionPairedDevices => 'Paired devices';

	/// en: 'Reload'
	String get reloadTooltip => 'Reload';

	/// en: 'Failed to list devices.'
	String get failedToListDevices => 'Failed to list devices.';

	/// en: 'No paired devices.'
	String get noPairedDevices => 'No paired devices.';

	/// en: 'Relay address'
	String get relayAddressTitle => 'Relay address';

	/// en: 'Server that connects your agents to the phone. Applies to every agent with the relay enabled.'
	String get relayAddressDesc => 'Server that connects your agents to the phone. Applies to every agent with the relay enabled.';

	/// en: 'Saving…'
	String get saving => 'Saving…';

	/// en: 'Check'
	String get check => 'Check';

	/// en: 'Online'
	String get healthOnline => 'Online';

	/// en: 'No response'
	String get healthNoResponse => 'No response';

	/// en: 'Not checked'
	String get healthNotChecked => 'Not checked';

	/// en: 'Device'
	String get deviceDefaultLabel => 'Device';

	/// en: 'Revoke'
	String get revoke => 'Revoke';

	/// en: 'Pair new device'
	String get pairNewDevice => 'Pair new device';

	/// en: 'Revoke device?'
	String get revokeDialogTitle => 'Revoke device?';

	/// en: '"${name}" will lose access to your agents and will need to pair again. You must be connected to the relay — the app will connect automatically to revoke.'
	String revokeDialogContent({required Object name}) => '"${name}" will lose access to your agents and will need to pair again.\n\nYou must be connected to the relay — the app will connect automatically to revoke.';
}

// Path: settings.page.schedules
class Translations$settings$page$schedules$en {
	Translations$settings$page$schedules$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Scheduled prompts'
	String get sectionScheduledPrompts => 'Scheduled prompts';

	/// en: 'Create schedule'
	String get createSchedule => 'Create schedule';

	/// en: 'Create a Daemon Agent first.'
	String get createDaemonFirst => 'Create a Daemon Agent first.';

	/// en: 'Supervisor offline. Schedules need pi-supervisord running (`remote-pi install`).'
	String get supervisorOffline => 'Supervisor offline. Schedules need pi-supervisord running (`remote-pi install`).';

	/// en: 'Failed to list schedules.'
	String get failedToListSchedules => 'Failed to list schedules.';

	/// en: 'No schedules. Create a recurring prompt for a daemon.'
	String get noSchedules => 'No schedules. Create a recurring prompt for a daemon.';

	/// en: 'Run now'
	String get runNow => 'Run now';

	/// en: 'View log'
	String get viewLog => 'View log';

	/// en: 'disabled'
	String get disabled => 'disabled';

	/// en: 'next ${when}'
	String nextRun({required Object when}) => 'next ${when}';

	/// en: 'last: ${label}'
	String lastRun({required Object label}) => 'last: ${label}';

	/// en: 'Remove schedule?'
	String get removeScheduleDialogTitle => 'Remove schedule?';

	/// en: 'The job "${schedule}" for ${daemon} is deleted. Its runs stop.'
	String removeScheduleDialogContent({required Object schedule, required Object daemon}) => 'The job "${schedule}" for ${daemon} is deleted. Its runs stop.';

	/// en: 'New schedule'
	String get newScheduleTitle => 'New schedule';

	/// en: 'Daemon'
	String get daemonLabel => 'Daemon';

	/// en: 'When (cron expression)'
	String get whenLabel => 'When (cron expression)';

	/// en: 'Next run shows up here'
	String get previewPlaceholder => 'Next run shows up here';

	/// en: 'Next: computed on save'
	String get previewComputed => 'Next: computed on save';

	/// en: 'Next: ${when}'
	String previewNext({required Object when}) => 'Next: ${when}';

	/// en: 'every day 9am'
	String get exampleEveryDay9am => 'every day 9am';

	/// en: 'hourly'
	String get exampleHourly => 'hourly';

	/// en: 'every 15 min'
	String get exampleEvery15Min => 'every 15 min';

	/// en: 'weekdays 6pm'
	String get exampleWeekdays6pm => 'weekdays 6pm';

	/// en: 'Prompt'
	String get promptLabel => 'Prompt';

	/// en: 'Timezone (optional)'
	String get timezoneLabel => 'Timezone (optional)';

	/// en: 'Skip if the agent is busy'
	String get skipIfBusy => 'Skip if the agent is busy';

	/// en: 'Wake the daemon if stopped'
	String get wakeIfStopped => 'Wake the daemon if stopped';

	/// en: 'Recover 1 missed run (catchup)'
	String get catchup => 'Recover 1 missed run (catchup)';

	/// en: 'Fill in the expression and the prompt.'
	String get fillRequiredError => 'Fill in the expression and the prompt.';

	/// en: 'Creating…'
	String get creating => 'Creating…';

	/// en: 'Failed to create the schedule.'
	String get failedToCreateSchedule => 'Failed to create the schedule.';

	/// en: 'History — ${schedule}'
	String historyTitle({required Object schedule}) => 'History — ${schedule}';

	/// en: 'Failed to read the log.'
	String get failedToReadLog => 'Failed to read the log.';

	/// en: 'No records yet.'
	String get noRecordsYet => 'No records yet.';

	/// en: 'delivered'
	String get cronDelivered => 'delivered';

	/// en: 'woke + delivered'
	String get cronWokeDelivered => 'woke + delivered';

	/// en: 'failed'
	String get cronFailed => 'failed';

	/// en: 'skipped (busy)'
	String get cronSkippedBusy => 'skipped (busy)';

	/// en: 'skipped (stopped)'
	String get cronSkippedStopped => 'skipped (stopped)';

	/// en: 'skipped (disabled)'
	String get cronSkippedDisabled => 'skipped (disabled)';
}

// Path: settings.page.daemons
class Translations$settings$page$daemons$en {
	Translations$settings$page$daemons$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Always-on agents'
	String get sectionAlwaysOnAgents => 'Always-on agents';

	/// en: 'Create daemon'
	String get createDaemon => 'Create daemon';

	/// en: 'Start all'
	String get startAll => 'Start all';

	/// en: 'Stop all'
	String get stopAll => 'Stop all';

	/// en: 'Restart all'
	String get restartAll => 'Restart all';

	/// en: 'Restart supervisor'
	String get restartSupervisor => 'Restart supervisor';

	/// en: 'Restart the supervisor?'
	String get restartSupervisorDialogTitle => 'Restart the supervisor?';

	/// en: 'Restarts the supervisor process (reloads the code). All daemons restart with it and go offline for a few seconds.'
	String get restartSupervisorDialogContent => 'Restarts the supervisor process (reloads the code). All daemons restart with it and go offline for a few seconds.';

	/// en: 'Remove daemon?'
	String get removeDaemonDialogTitle => 'Remove daemon?';

	/// en: '"${name}" stops running and leaves the registry. The folder and its local config are kept — you can recreate it later.'
	String removeDaemonDialogContent({required Object name}) => '"${name}" stops running and leaves the registry. The folder and its local config are kept — you can recreate it later.';

	/// en: 'Supervisor offline'
	String get supervisorOfflineTitle => 'Supervisor offline';

	/// en: 'pi-supervisord is not running. Install it with `remote-pi install` to manage 24/7 agents.'
	String get supervisorOfflineDesc => 'pi-supervisord is not running. Install it with `remote-pi install` to manage 24/7 agents.';

	/// en: 'Failed to list daemons.'
	String get failedToListDaemons => 'Failed to list daemons.';

	/// en: 'No registered agents. Create one from a folder.'
	String get noRegisteredAgents => 'No registered agents. Create one from a folder.';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'running'
	String get stateRunning => 'running';

	/// en: 'starting'
	String get stateStarting => 'starting';

	/// en: 'stopped'
	String get stateStopped => 'stopped';

	/// en: 'failed'
	String get stateFailed => 'failed';

	/// en: 'New daemon'
	String get newDaemonTitle => 'New daemon';

	/// en: 'Edit daemon'
	String get editDaemonTitle => 'Edit daemon';

	/// en: 'Name'
	String get nameLabel => 'Name';

	/// en: 'e.g. PC, Server, Home'
	String get namePlaceholder => 'e.g. PC, Server, Home';

	/// en: 'Enter a name.'
	String get nameRequiredError => 'Enter a name.';

	/// en: 'An agent with this name already exists.'
	String get nameDuplicateError => 'An agent with this name already exists.';

	/// en: 'Folder'
	String get folderLabel => 'Folder';

	/// en: 'No folder chosen'
	String get noFolderChosen => 'No folder chosen';

	/// en: 'Choose'
	String get choose => 'Choose';

	/// en: 'Change'
	String get changeFolder => 'Change';

	/// en: 'The folder cannot be changed.'
	String get folderCannotBeChanged => 'The folder cannot be changed.';

	/// en: 'Choose a folder.'
	String get folderRequiredError => 'Choose a folder.';

	/// en: 'An agent already exists in this folder.'
	String get folderDuplicateError => 'An agent already exists in this folder.';

	/// en: 'Choose the Daemon Agent folder'
	String get pickFolderDialogTitle => 'Choose the Daemon Agent folder';
}

// Path: settings.page.automations
class Translations$settings$page$automations$en {
	Translations$settings$page$automations$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Commit messages'
	String get sectionCommitMessages => 'Commit messages';

	/// en: 'Harness'
	String get harness => 'Harness';

	/// en: 'Looking for installed command-line harnesses…'
	String get harnessDiscovering => 'Looking for installed command-line harnesses…';

	/// en: 'No supported harness was found on PATH.'
	String get harnessNoneFound => 'No supported harness was found on PATH.';

	/// en: '${harness} is configured but unavailable.'
	String harnessConfiguredUnavailable({required Object harness}) => '${harness} is configured but unavailable.';

	/// en: 'Choose the CLI used to generate commit messages.'
	String get harnessChoose => 'Choose the CLI used to generate commit messages.';

	/// en: 'Refresh installed harnesses'
	String get harnessRefresh => 'Refresh installed harnesses';

	/// en: 'Not configured'
	String get notConfigured => 'Not configured';

	/// en: 'Model'
	String get model => 'Model';

	/// en: 'The model list is unavailable until the harness is found.'
	String get modelUnavailable => 'The model list is unavailable until the harness is found.';

	/// en: 'This harness uses its CLI default model.'
	String get modelCliOnly => 'This harness uses its CLI default model.';

	/// en: 'CLI default'
	String get modelCliDefault => 'CLI default';

	/// en: 'Auto'
	String get modelAuto => 'Auto';

	/// en: 'Search among ${count} models…'
	String modelSearch({required Object count}) => 'Search among ${count} models…';

	/// en: 'This harness routes the model automatically.'
	String get modelAutoRouted => 'This harness routes the model automatically.';

	/// en: 'Only models your account can use are listed.'
	String get modelAccountOnly => 'Only models your account can use are listed.';

	/// en: 'Generate from Source Control'
	String get generateFromSourceControl => 'Generate from Source Control';

	/// en: 'FlightDeck sends only the selected diff and recent commit subjects. Common credential patterns and sensitive files are redacted before the harness runs.'
	String get generateFromSourceControlDescription => 'FlightDeck sends only the selected diff and recent commit subjects. Common credential patterns and sensitive files are redacted before the harness runs.';

	/// en: 'Could not discover installed automation harnesses.'
	String get discoveryFailed => 'Could not discover installed automation harnesses.';

	/// en: 'Model "${model}" is no longer available for ${harness}. Using the CLI default — pick another model in Settings if needed.'
	String staleModel({required Object model, required Object harness}) => 'Model "${model}" is no longer available for ${harness}. Using the CLI default — pick another model in Settings if needed.';

	/// en: 'Recommended'
	String get recommendedSuffix => 'Recommended';
}

// Path: settings.page.general.updateFrequency
class Translations$settings$page$general$updateFrequency$en {
	Translations$settings$page$general$updateFrequency$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Daily'
	String get daily => 'Daily';

	/// en: 'Weekly'
	String get weekly => 'Weekly';

	/// en: 'Monthly'
	String get monthly => 'Monthly';

	/// en: 'Never'
	String get never => 'Never';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'core.bootstrapError.title' => 'Failed to initialize FlightDeck',
			'core.bootstrapError.retry' => 'Retry',
			'core.macosNotifications.title' => 'Enable Notifications on macOS',
			'core.macosNotifications.intro' => 'Notifications are currently disabled in your system settings. Follow the steps below to enable them:',
			'core.macosNotifications.step1' => 'Open System Settings on your Mac.',
			'core.macosNotifications.step2' => 'Navigate to the Notifications section in the left sidebar.',
			'core.macosNotifications.step3' => 'Find and select the FlightDeck application from the list.',
			'core.macosNotifications.step4' => 'Toggle the Allow Notifications switch on.',
			'core.macosNotifications.tip' => 'Tip: If the app does not appear in the list, close and reopen it to trigger its registration in the system.',
			'core.macosNotifications.gotIt' => 'Got it',
			'core.appErrorView.renderFailed' => 'This part of the app failed to render',
			'core.appErrorView.details' => 'Details',
			'core.appErrorView.renderErrorTitle' => 'Render error',
			'core.errorReportDialog.defaultDescription' => 'Something went wrong. The details below were saved to the log — you can report them so it gets fixed.',
			'core.errorReportDialog.copyDetails' => 'Copy details',
			'core.errorReportDialog.reportIssue' => 'Report issue',
			'core.windowControls.minimize' => 'Minimize',
			'core.windowControls.maximize' => 'Maximize',
			'core.windowControls.close' => 'Close',
			'core.crash.title' => 'Unexpected shutdown',
			'core.crash.bannerTitle' => 'FlightDeck closed unexpectedly',
			'core.crash.report' => 'Report',
			'core.crash.dismiss' => 'Dismiss',
			'core.crash.crashMessage' => ({required Object version}) => 'The previous session (version ${version}) ended without shutting down cleanly. Want to report it? The log is included and you can review everything before sending.',
			'core.crash.crashError' => ({required Object startedAt, required Object pid}) => 'Session started at ${startedAt} (pid ${pid}) ended without a clean shutdown.',
			'core.crash.crashDescription' => 'No error was captured — the app was terminated by the system. The log below is from that session and is the most useful part.',
			'core.menu.settings' => 'Settings…',
			'core.menu.checkForUpdates' => 'Check for Updates…',
			'core.menu.file' => 'File',
			'core.menu.newAgent' => 'New Agent',
			'core.menu.newTerminal' => 'New Terminal',
			'core.menu.openWorkspace' => 'Open Workspace',
			'core.menu.save' => 'Save',
			'core.menu.discard' => 'Discard',
			'core.menu.format' => 'Format',
			'core.menu.view' => 'View',
			'core.menu.toggleWorkspacePanel' => 'Toggle Workspace Panel',
			'core.menu.toggleFiles' => 'Toggle Files',
			'core.menu.splitRight' => 'Split Right',
			'core.menu.splitDown' => 'Split Down',
			'core.menu.focusPane' => 'Focus Pane',
			'core.menu.focusLeft' => 'Left  (⌘⌥←)',
			'core.menu.focusRight' => 'Right  (⌘⌥→)',
			'core.menu.focusUp' => 'Up  (⌘⌥↑)',
			'core.menu.focusDown' => 'Down  (⌘⌥↓)',
			'core.menu.selectTab' => 'Select Tab',
			'core.menu.tabN' => ({required Object n}) => 'Tab ${n}',
			'core.menu.lastTab' => 'Last Tab',
			'core.menu.zoomIn' => 'Zoom In',
			'core.menu.zoomOut' => 'Zoom Out',
			'core.menu.actualSize' => 'Actual Size',
			'core.menu.window' => 'Window',
			'core.menu.quit' => 'Quit',
			'core.menu.minimize' => 'Minimize',
			'core.menu.zoom' => 'Zoom',
			'common.cancel' => 'Cancel',
			'common.confirm' => 'Confirm',
			'common.create' => 'Create',
			'common.gotIt' => 'Got it',
			'common.save' => 'Save',
			'common.close' => 'Close',
			'common.delete' => 'Delete',
			'common.done' => 'Done',
			'common.add' => 'Add',
			'common.test' => 'Test',
			'common.ok' => 'OK',
			'common.loading' => 'Loading…',
			'common.checking' => 'Checking…',
			'common.remove' => 'Remove',
			'common.restart' => 'Restart',
			'common.settings' => 'Settings',
			'common.send' => 'Send',
			'common.open' => 'Open',
			'common.dismiss' => 'Dismiss',
			'common.report' => 'Report',
			'common.copyCode' => 'Copy code',
			'common.search' => 'Search',
			'common.noResults' => 'No results',
			'flightdeck.confirmDialog.unsavedChangesTitle' => 'Unsaved changes',
			'flightdeck.confirmDialog.unsavedChangesMessage' => ({required Object fileName}) => '“${fileName}” has unsaved changes. Save them before closing?',
			'flightdeck.confirmDialog.dontSave' => 'Don\'t save',
			'flightdeck.confirmDialog.saveAndClose' => 'Save & close',
			'flightdeck.historyDialog.title' => 'Session history',
			'flightdeck.historyDialog.subtitle' => 'Opening one replaces this agent\'s current transcript',
			'flightdeck.historyDialog.empty' => 'No saved sessions in this folder.',
			'flightdeck.historyDialog.untitledSession' => 'Untitled session',
			'flightdeck.historyDialog.justNow' => 'now',
			'flightdeck.historyDialog.minutesAgo' => ({required Object n}) => '${n} min ago',
			'flightdeck.historyDialog.hoursAgo' => ({required Object n}) => '${n} h ago',
			'flightdeck.historyDialog.daysAgo' => ({required Object n}) => '${n} d ago',
			'flightdeck.worktreeCreateDialog.forkTitle' => 'Fork worktree',
			'flightdeck.worktreeCreateDialog.createTitle' => 'Create worktree',
			'flightdeck.worktreeCreateDialog.forkSubtitle' => ({required Object root}) => 'New worktree branched from ${root}.',
			'flightdeck.worktreeCreateDialog.createSubtitle' => ({required Object root}) => 'New feature in ${root} — new branch from the current HEAD.',
			'flightdeck.worktreeCreateDialog.namePlaceholder' => 'feat/minha-feature',
			'flightdeck.worktreeCreateDialog.errorWhitespace' => 'No spaces in the name.',
			'flightdeck.worktreeCreateDialog.errorInvalidChar' => 'Invalid character for a branch name.',
			'flightdeck.worktreeCreateDialog.errorInvalidSequence' => 'Invalid sequence (e.g. "..", "//", starting/ending with "/").',
			'flightdeck.worktreeCreateDialog.errorReserved' => 'Reserved position (do not start with "-"/"." or end with ".lock").',
			'flightdeck.worktreeCreateDialog.errorDuplicateBranch' => 'A branch with that name already exists.',
			'flightdeck.worktreeCreateDialog.errorDuplicateWorktree' => 'A worktree with that name already exists.',
			'flightdeck.worktreeCreateDialog.errorBranchHierarchyConflict' => ({required Object target, required Object existing}) => 'Cannot create branch \'${target}\' because it conflicts with the existing branch \'${existing}\'.',
			'flightdeck.worktreeCreateDialog.errorBranchHierarchicalConflictGeneral' => 'A branch with a conflicting hierarchy already exists.',
			'flightdeck.worktreeCreateDialog.fork' => 'Fork',
			'flightdeck.worktreeCreateDialog.postCheckoutHint' => 'This repository has a post-checkout hook.',
			'flightdeck.worktreeCreateDialog.running' => 'Running…',
			'flightdeck.worktreeCreateDialog.advancedSettings' => 'Advanced Settings',
			'flightdeck.worktreeCreateDialog.copyIgnored' => 'Copy ignored files (.gitignore)',
			'flightdeck.worktreeCreateDialog.copyIgnoredDesc' => 'Copies files ignored by .gitignore (e.g. .env, local keys) to the new worktree.',
			'flightdeck.worktreeCreateDialog.copyUntracked' => 'Copy untracked files',
			'flightdeck.worktreeCreateDialog.copyUntrackedDesc' => 'Copies new or modified files that haven\'t been staged yet.',
			'flightdeck.worktreeCreateDialog.baseBranch' => 'Base branch',
			'flightdeck.worktreeCreateDialog.baseBranchDesc' => 'The branch from which the new worktree and branch will be created.',
			'flightdeck.worktreeCreateDialog.fetchRemote' => 'Fetch remote branch',
			'flightdeck.worktreeCreateDialog.fetchRemoteDesc' => 'Run git fetch to guarantee the base branch is confirmed before creating the worktree.',
			'flightdeck.worktreeCreateDialog.searchBranch' => 'Search branch...',
			'flightdeck.worktreeCreateDialog.back' => 'Back',
			'flightdeck.subfolderDialog.title' => 'Where to work?',
			'flightdeck.subfolderDialog.empty' => 'No subfolders here.',
			'flightdeck.subfolderDialog.useRoot' => ({required Object project}) => 'Use the root of ${project}',
			'flightdeck.subfolderDialog.usePath' => ({required Object project, required Object rel}) => 'Use ${project}/${rel}',
			'flightdeck.subfolderDialog.useThisFolder' => 'Use this folder',
			'flightdeck.commitMessageDialog.commitTitle' => 'Commit',
			'flightdeck.commitMessageDialog.stageAndCommitTitle' => 'Stage and Commit',
			'flightdeck.commitMessageDialog.scopeNote' => ({required Object fileName}) => 'Commit "${fileName}" only.',
			'flightdeck.commitMessageDialog.placeholder' => 'fix: short summary of the change',
			'flightdeck.commitMessageDialog.errorEmptySubject' => 'The first line (subject) cannot be empty.',
			'flightdeck.commitMessageDialog.errorTooShort' => ({required Object min}) => 'Subject too short (min ${min} characters).',
			'flightdeck.commitMessageDialog.errorTooLong' => ({required Object max}) => 'Subject too long (max ${max} characters).',
			'flightdeck.commitMessageDialog.errorTrailingPeriod' => 'Subject should not end with a period.',
			'flightdeck.commitMessageDialog.errorControlChars' => 'Subject contains control characters.',
			'flightdeck.commitMessageDialog.errorBlankSecondLine' => 'Leave the second line blank (git subject/body separator).',
			'flightdeck.commitMessageDialog.generate' => 'Generate commit message',
			'flightdeck.commitMessageDialog.generateWith' => ({required Object harness}) => 'Generate with ${harness}',
			'flightdeck.commitMessageDialog.generating' => 'Generating…',
			'flightdeck.commitMessageDialog.cancelGeneration' => 'Cancel generation',
			'flightdeck.agentEditDialog.title' => 'Edit agent',
			'flightdeck.agentEditDialog.agentName' => 'Agent name',
			'flightdeck.agentEditDialog.relaySection' => 'Relay (remote-pi)',
			'flightdeck.agentEditDialog.autoConnect' => 'Auto-connect on start',
			'flightdeck.agentEditDialog.informationSection' => 'Information',
			'flightdeck.agentEditDialog.folder' => 'Folder',
			'flightdeck.agentEditDialog.model' => 'Model',
			'flightdeck.agentEditDialog.state' => 'State',
			'flightdeck.agentEditDialog.context' => 'Context',
			'flightdeck.agentEditDialog.statusEmpty' => 'empty',
			'flightdeck.agentEditDialog.statusStarting' => 'starting',
			'flightdeck.agentEditDialog.statusReady' => 'ready',
			'flightdeck.agentEditDialog.statusStreaming' => 'streaming',
			'flightdeck.agentEditDialog.statusEnded' => 'ended',
			'flightdeck.agentSetupChecklist.title' => 'Set up the agent environment',
			'flightdeck.agentSetupChecklist.intro' => 'Running an agent needs Pi installed. Complete the steps below — terminals and files work without any of this.',
			'flightdeck.agentSetupChecklist.step1Title' => 'Pi Code installed',
			'flightdeck.agentSetupChecklist.step1Description' => 'The `pi` binary must be accessible.',
			'flightdeck.agentSetupChecklist.step2Title' => 'remote-pi extension on Pi',
			'flightdeck.agentSetupChecklist.step2Description' => 'Registered in ~/.pi/agent/settings.json.',
			'flightdeck.agentSetupChecklist.step3Title' => 'Supervisor installed',
			'flightdeck.agentSetupChecklist.step3Description' => 'pi-supervisord service (remote-pi install).',
			'flightdeck.agentSetupChecklist.install' => 'Install',
			'flightdeck.agentSetupChecklist.installExtensionTitle' => 'Install remote-pi extension',
			'flightdeck.agentSetupChecklist.installSupervisorTitle' => 'Install supervisor',
			'flightdeck.agentSetupChecklist.createAgent' => 'Create agent',
			'flightdeck.agentSetupChecklist.back' => 'Back',
			'flightdeck.agentSetupChecklist.checkAgain' => 'Check again',
			'flightdeck.agentSetupChecklist.notRequired' => 'Not required in this setup',
			'flightdeck.agentSetupChecklist.installing' => 'Installing…',
			'flightdeck.agentSetupChecklist.installedSuccessfully' => 'Installed successfully.',
			'flightdeck.agentComposer.cmdNewDescription' => 'New session — clears the conversation',
			'flightdeck.agentComposer.cmdCompactDescription' => 'Compacts the agent context',
			'flightdeck.agentComposer.attachFile' => 'Attach file',
			'flightdeck.agentComposer.maxImages' => ({required Object max}) => 'Maximum of ${max} images.',
			'flightdeck.agentComposer.placeholder' => 'Message to the agent, use @files or /commands',
			'flightdeck.agentComposer.stop' => 'Stop',
			'flightdeck.agentComposer.send' => 'Send',
			'flightdeck.agentComposer.relayOnline' => 'Relay online',
			'flightdeck.agentComposer.relayReconnecting' => 'Relay reconnecting...',
			'flightdeck.agentComposer.relayOffline' => 'Relay offline',
			'flightdeck.agentComposer.contextTooltip' => ({required Object pct}) => 'Context: ${pct}% of the window',
			'flightdeck.agentComposer.visionWarning' => 'The current model cannot see images — switch to one with vision.',
			'flightdeck.agentComposer.modelFallback' => 'model',
			'flightdeck.tasksPanel.reloadTasksTooltip' => 'Reload tasks',
			'flightdeck.tasksPanel.restartTooltip' => 'Restart',
			'flightdeck.tasksPanel.stopTooltip' => 'Stop',
			'flightdeck.tasksPanel.runTooltip' => 'Run',
			'flightdeck.tasksPanel.sendsKeyTooltip' => ({required Object label, required Object key}) => '${label} (sends \'${key}\')',
			'flightdeck.tasksPanel.startingTooltip' => 'Starting…',
			'flightdeck.tasksPanel.stoppingTooltip' => 'Stopping…',
			'flightdeck.tasksPanel.switchProfileTooltip' => 'Switch profile',
			'flightdeck.tasksPanel.moreKeysTooltip' => 'More keys',
			'flightdeck.tasksPanel.sectionTasks' => 'TASKS',
			'flightdeck.tasksPanel.noTasks' => 'No tasks detected in this project.',
			'flightdeck.tasksPanel.createTasksJson' => 'Create tasks.json',
			'flightdeck.flightdeckPage.chooseProjectFolderDialogTitle' => 'Choose the project folder',
			'flightdeck.flightdeckPage.chooseWorkspaceFolderDialogTitle' => 'Choose the workspace folder',
			'flightdeck.flightdeckPage.workspaceRenamedTitle' => 'Workspace renamed',
			'flightdeck.flightdeckPage.workspaceRenamedMessage' => ({required Object name}) => 'The new name "${name}" will only be sent to agents after restarting the workspace or the application.',
			'flightdeck.flightdeckPage.syncTitle' => ({required Object label}) => 'Sync — ${label}',
			'flightdeck.flightdeckPage.pullTitle' => ({required Object label}) => 'Pull — ${label}',
			'flightdeck.flightdeckPage.pushTitle' => ({required Object label}) => 'Push — ${label}',
			'flightdeck.flightdeckPage.updateFromParentTitle' => ({required Object name}) => 'Update from Parent — ${name}',
			'flightdeck.flightdeckPage.mergeToParentTitle' => ({required Object name}) => 'Merge to Parent — ${name}',
			'flightdeck.flightdeckPage.worktreeMergedAndRemoved' => 'Worktree merged and removed.',
			'flightdeck.flightdeckPage.nothingWasChanged' => 'Nothing was changed.',
			'flightdeck.flightdeckPage.newRealmTitle' => 'New realm',
			'flightdeck.flightdeckPage.closeWorkspaceTitle' => 'Close workspace',
			'flightdeck.flightdeckPage.closeWorkspaceMessage' => ({required Object name}) => 'Close "${name}"? The agents in this workspace will be terminated. The folder on disk is kept.',
			'flightdeck.flightdeckPage.closeAction' => 'Close',
			'flightdeck.flightdeckPage.removeWorktreeTitle' => 'Remove worktree',
			'flightdeck.flightdeckPage.removeWorktreeMessage' => ({required Object name, required Object warn}) => 'Remove "${name}"? The worktree folder and the branch will be deleted and the agents in this fork will be terminated.${warn}',
			'flightdeck.flightdeckPage.removeWorktreeWarning' => ({required Object name}) => '\n\nWarning: the branch "${name}" has not been merged yet — removing it (git branch -D) discards the unmerged work.',
			'flightdeck.flightdeckPage.failedToRemoveWorktreeTitle' => 'Failed to remove worktree',
			'flightdeck.flightdeckPage.openLayoutTitle' => 'Open layout',
			'flightdeck.flightdeckPage.restartServerTooltip' => 'Restart server',
			'flightdeck.flightdeckPage.noLspAvailable' => 'No LSP available',
			'flightdeck.flightdeckPage.lspRunning' => 'running',
			'flightdeck.flightdeckPage.lspStopped' => 'stopped',
			'flightdeck.welcomeView.title' => 'Welcome to FlightDeck',
			'flightdeck.welcomeView.subtitle' => 'Open a folder or connect to a remote host to start.',
			'flightdeck.welcomeView.createWorkspace' => 'Create workspace',
			'flightdeck.welcomeView.openLocalFolder' => 'Open local folder',
			'flightdeck.welcomeView.connectHost' => 'Connect to host',
			'flightdeck.welcomeView.configureHost' => 'Configure host',
			'flightdeck.welcomeView.addWorkspace' => 'Add workspace',
			'flightdeck.modelPicker.search' => ({required Object count}) => 'Search model (${count})',
			'flightdeck.paneView.closePaneTitle' => 'Close pane?',
			'flightdeck.paneView.closePaneMessage' => ({required Object count}) => 'This closes all ${count} tab(s) in this pane and ends the agents/terminals in it.',
			'flightdeck.paneView.close' => 'Close',
			'flightdeck.paneView.allTabs' => 'All tabs',
			'flightdeck.paneView.pinTab' => 'Pin tab',
			'flightdeck.paneView.rename' => 'Rename',
			'flightdeck.paneView.openAsMarkdown' => 'Open as markdown',
			'flightdeck.paneView.openAsBoard' => 'Open as board',
			'flightdeck.paneView.resetTitle' => 'Reset Title',
			'flightdeck.paneView.copyId' => 'Copy Id',
			'flightdeck.paneView.autoRelay' => 'Auto-relay',
			'flightdeck.paneView.history' => 'History',
			'flightdeck.paneView.newTab' => 'New tab',
			'flightdeck.paneView.newTerminal' => 'New terminal…',
			'flightdeck.paneView.splitRight' => 'Split right',
			'flightdeck.paneView.splitDown' => 'Split down',
			'flightdeck.paneView.closePane' => 'Close pane',
			'flightdeck.paneView.dropHereToMove' => 'Drop here to move the tab',
			'flightdeck.paneView.dockAsTab' => 'Dock as tab',
			'flightdeck.paneView.openBrowser' => 'Open browser',
			'flightdeck.paneView.openTerminal' => 'Open terminal',
			'flightdeck.fileTreePanel.viewDiff' => 'View Diff',
			'flightdeck.fileTreePanel.commit' => 'Commit',
			'flightdeck.fileTreePanel.stageAndCommit' => 'Stage and Commit',
			'flightdeck.fileTreePanel.unstage' => 'Unstage',
			'flightdeck.fileTreePanel.stageChanges' => 'Stage Changes',
			'flightdeck.fileTreePanel.discardChanges' => 'Discard Changes',
			'flightdeck.fileTreePanel.enterCommitMessage' => 'Enter a commit message.',
			'flightdeck.fileTreePanel.commitUnavailable' => 'Commit is unavailable for this workspace.',
			'flightdeck.fileTreePanel.gitErrorTitle' => 'Git error',
			'flightdeck.fileTreePanel.deleteNewFileTitle' => 'Delete new file?',
			'flightdeck.fileTreePanel.discardChangesTitle' => 'Discard changes?',
			'flightdeck.fileTreePanel.deleteNewFileMessage' => ({required Object name}) => '"${name}" is a new file and cannot be restored. Delete it?',
			'flightdeck.fileTreePanel.discardOneMessage' => ({required Object name}) => 'Discard all changes in "${name}"? Deleted files will be restored.',
			'flightdeck.fileTreePanel.discard' => 'Discard',
			'flightdeck.fileTreePanel.deleteAllNewFilesTitle' => 'Delete all new files?',
			'flightdeck.fileTreePanel.allNewFilesMessage' => ({required Object count}) => 'All ${count} files are new and will be deleted. This cannot be undone.',
			'flightdeck.fileTreePanel.discardTrackedMessage' => ({required Object count, required Object extra}) => 'Discard changes in ${count} tracked file(s)?${extra}',
			'flightdeck.fileTreePanel.discardTrackedExtra' => ({required Object count}) => ' ${count} new file(s) will be kept.',
			'flightdeck.fileTreePanel.deleteAll' => 'Delete All',
			'flightdeck.fileTreePanel.deleteQuestionTitle' => 'Delete?',
			'flightdeck.fileTreePanel.moveToTrash' => ({required Object name}) => 'Move “${name}” to the Trash?',
			'flightdeck.fileTreePanel.permanentlyDelete' => ({required Object name}) => 'Permanently delete “${name}”? This can’t be undone.',
			'flightdeck.fileTreePanel.couldNotDeleteTitle' => 'Could not delete',
			'flightdeck.fileTreePanel.moveQuestionTitle' => 'Move?',
			'flightdeck.fileTreePanel.moveMessage' => ({required Object name, required Object dest}) => 'Move “${name}” to “${dest}”?',
			'flightdeck.fileTreePanel.moveAction' => 'Move',
			'flightdeck.fileTreePanel.couldNotMoveTitle' => 'Could not move',
			'flightdeck.fileTreePanel.couldNotPasteTitle' => 'Could not paste',
			'flightdeck.fileTreePanel.filesTooltip' => 'Files',
			'flightdeck.fileTreePanel.searchTooltip' => 'Search',
			'flightdeck.fileTreePanel.sourceControlTooltip' => 'Source Control',
			'flightdeck.fileTreePanel.databaseTooltip' => 'Database',
			'flightdeck.fileTreePanel.sectionFiles' => 'FILES',
			'flightdeck.fileTreePanel.newFile' => 'New file',
			'flightdeck.fileTreePanel.newFolder' => 'New folder',
			'flightdeck.fileTreePanel.refreshTooltip' => 'Refresh',
			'flightdeck.fileTreePanel.collapseAll' => 'Collapse all folders',
			'flightdeck.fileTreePanel.sectionSourceControl' => 'SOURCE CONTROL',
			'flightdeck.fileTreePanel.viewAsList' => 'View as List',
			'flightdeck.fileTreePanel.viewAsTree' => 'View as Tree',
			'flightdeck.fileTreePanel.noFolderMessage' => 'No folder — open a workspace.',
			'flightdeck.fileTreePanel.amend' => 'Amend',
			'flightdeck.fileTreePanel.commitMessagePlaceholder' => 'Commit Message',
			'flightdeck.fileTreePanel.amendCommit' => 'Amend Commit',
			'flightdeck.fileTreePanel.lastCommit' => 'last commit',
			'flightdeck.fileTreePanel.openInFinder' => 'Open in Finder',
			'flightdeck.fileTreePanel.openInExplorer' => 'Open in Explorer',
			'flightdeck.fileTreePanel.openInFileManager' => 'Open in file manager',
			'flightdeck.fileTreePanel.open' => 'Open',
			'flightdeck.fileTreePanel.openWith' => 'Open with',
			'flightdeck.fileTreePanel.openLayout' => 'Open layout',
			'flightdeck.fileTreePanel.openAsMarkdown' => 'Open as markdown',
			'flightdeck.fileTreePanel.showGitDiff' => 'Show git diff',
			'flightdeck.fileTreePanel.createAgent' => 'Create agent',
			'flightdeck.fileTreePanel.createTerminal' => 'Create terminal',
			'flightdeck.fileTreePanel.rename' => 'Rename',
			'flightdeck.fileTreePanel.copy' => 'Copy',
			'flightdeck.fileTreePanel.cut' => 'Cut',
			'flightdeck.fileTreePanel.paste' => 'Paste',
			'flightdeck.fileTreePanel.copyRelativePath' => 'Copy relative path',
			'flightdeck.fileTreePanel.copyAbsolutePath' => 'Copy absolute path',
			'flightdeck.fileTreePanel.renameFailed' => 'Rename failed.',
			'flightdeck.fileTreePanel.noChanges' => 'No changes.',
			'flightdeck.fileTreePanel.stagedChangesHeader' => ({required Object count}) => 'STAGED CHANGES (${count})',
			'flightdeck.fileTreePanel.changesHeader' => ({required Object count}) => 'CHANGES (${count})',
			'flightdeck.fileTreePanel.discardAllChanges' => 'Discard All Changes',
			'flightdeck.fileTreePanel.unstageAllChanges' => 'Unstage All Changes',
			'flightdeck.fileTreePanel.stageAllChanges' => 'Stage All Changes',
			'flightdeck.fileTreePanel.discardFolderChanges' => 'Discard Folder Changes',
			'flightdeck.fileTreePanel.unstageFolderChanges' => 'Unstage Folder Changes',
			'flightdeck.fileTreePanel.stageFolderChanges' => 'Stage Folder Changes',
			'flightdeck.fileTreePanel.generateCommitMessage' => 'Generate commit message',
			'flightdeck.fileTreePanel.generateWith' => ({required Object harness}) => 'Generate with ${harness}',
			'flightdeck.fileTreePanel.generateUnavailableWhileAmending' => 'Unavailable while amending a commit',
			'flightdeck.fileTreePanel.cancelGeneration' => 'Cancel generation',
			'flightdeck.fileTreePanel.changes' => 'Changes',
			'flightdeck.fileTreePanel.history' => 'History',
			'flightdeck.fileTreePanel.historyRepository' => 'Repository',
			'flightdeck.fileTreePanel.historyNoRepository' => 'No Git repository available.',
			'flightdeck.fileTreePanel.historyEmpty' => 'No commits found.',
			'flightdeck.fileTreePanel.historyLoadFailed' => 'Could not load Git history.',
			'flightdeck.fileTreePanel.historyUntitledCommit' => 'Untitled commit',
			'flightdeck.fileTreePanel.historyNow' => 'now',
			'flightdeck.fileTreePanel.historyMinutesAgo' => ({required Object count}) => '${count}m ago',
			'flightdeck.fileTreePanel.historyHoursAgo' => ({required Object count}) => '${count}h ago',
			'flightdeck.fileTreePanel.historyYesterday' => 'yesterday',
			'flightdeck.fileTreePanel.historyDayAgo' => '1d ago',
			'flightdeck.fileTreePanel.historyDaysAgo' => ({required Object count}) => '${count}d ago',
			'flightdeck.fileTreePanel.historyFiles' => 'Files changed',
			'flightdeck.fileTreePanel.historyFilesEmpty' => 'No files changed.',
			'flightdeck.fileTreePanel.historyFilesLoadFailed' => 'Could not load changed files.',
			'flightdeck.fileTreePanel.diffEmptyTree' => 'Empty tree',
			'flightdeck.fileTreePanel.diffOriginal' => ({required Object ref}) => 'Original ${ref}',
			'flightdeck.fileTreePanel.diffModified' => ({required Object ref}) => 'Modified ${ref}',
			'flightdeck.fileTreePanel.diffWorkingTree' => 'Working tree',
			'flightdeck.fileTreePanel.diffBinaryFile' => 'Binary file - no text diff.',
			'flightdeck.fileTreePanel.diffNoChanges' => 'No changes.',
			'flightdeck.fileTreePanel.diffError' => ({required Object detail}) => 'Could not read the diff: ${detail}',
			'flightdeck.fileTreePanel.galleryTooltip' => 'Gallery',
			'flightdeck.fileTreePanel.sectionGallery' => 'GALLERY',
			'flightdeck.fileViewer.cantOpen' => 'Can\'t open this file.',
			'flightdeck.fileViewer.couldNotLoadImage' => 'Could not load the image.',
			'flightdeck.fileViewer.preview' => 'Preview',
			'flightdeck.fileViewer.source' => 'Source',
			'flightdeck.workspaceSettingsDialog.choosePhotoTitle' => 'Choose workspace photo',
			'flightdeck.workspaceSettingsDialog.title' => 'Workspace settings',
			'flightdeck.workspaceSettingsDialog.namePlaceholder' => 'Workspace name',
			'flightdeck.workspaceSettingsDialog.addPhoto' => 'Add photo',
			'flightdeck.workspaceSettingsDialog.changePhoto' => 'Change photo',
			'flightdeck.workspaceSettingsDialog.remove' => 'Remove',
			'flightdeck.workspaceSettingsDialog.color' => 'Color',
			'flightdeck.workspaceSettingsDialog.host' => 'Host',
			'flightdeck.workspaceSettingsDialog.folder' => 'Folder',
			'flightdeck.realmDialogs.namePlaceholder' => 'Realm name',
			'flightdeck.realmDialogs.duplicateName' => 'A realm with this name already exists.',
			'flightdeck.realmDialogs.newRealmTitle' => 'New realm',
			'flightdeck.realmDialogs.renameRealmTitle' => 'Rename realm',
			'flightdeck.realmDialogs.rename' => 'Rename',
			'flightdeck.realmDialogs.deleteRealmTitle' => 'Delete realm',
			'flightdeck.realmDialogs.deleteMessage' => ({required Object name, required Object suffix}) => 'Delete "${name}"? No workspace is deleted — the folder list just changes.${suffix}',
			'flightdeck.realmDialogs.deleteSuffixOne' => ' Its workspace will move to Default.',
			'flightdeck.realmDialogs.deleteSuffixMany' => ({required Object count}) => ' Its ${count} workspaces will move to Default.',
			'flightdeck.realmDialogs.manageRealmsTitle' => 'Manage realms',
			'flightdeck.realmDialogs.workspaceCount' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '1 workspace', other: '${n} workspaces', ),
			'flightdeck.dbRedisTable.deleteKeyTitle' => 'Delete key',
			'flightdeck.dbRedisTable.deleteKeyMessage' => ({required Object key}) => 'Delete "${key}" from this Redis database?',
			'flightdeck.dbRedisTable.refresh' => 'Refresh',
			'flightdeck.dbRedisTable.newKey' => 'New key',
			'flightdeck.dbRedisTable.columnKey' => 'KEY',
			'flightdeck.dbRedisTable.columnValue' => 'VALUE',
			'flightdeck.dbRedisTable.columnType' => 'TYPE',
			'flightdeck.dbRedisTable.columnTtl' => 'TTL',
			'flightdeck.dbRedisTable.keyCount' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '1 key', other: '${n} keys', ),
			'flightdeck.dbRedisTable.noKeys' => 'No keys in this database.',
			'flightdeck.dbRedisTable.noKeysMatch' => ({required Object pattern}) => 'No keys match "${pattern}".',
			'flightdeck.dbRedisTable.loadMore' => 'Load more',
			'flightdeck.dbRedisTable.loadingFullValue' => 'Loading full value…',
			'flightdeck.dbRedisTable.ttlMustBeNumber' => 'TTL must be a number of seconds.',
			'flightdeck.dbRedisTable.addKey' => 'Add key',
			'flightdeck.dbRedisTable.keyFieldHint' => 'key',
			'flightdeck.dbRedisTable.ttlFieldHint' => 'ttl (s, optional)',
			'flightdeck.dbRedisTable.valueFieldHint' => 'value',
			'flightdeck.dbRedisTable.searchHint' => 'Search — pattern, e.g. user:*',
			'flightdeck.dbQueryView.saveQueryAs' => 'Save query as',
			'flightdeck.dbQueryView.couldNotSave' => 'Could not save',
			'flightdeck.dbQueryView.selectDatabase' => 'Select database',
			'flightdeck.dbQueryView.noSqlConnections' => 'No SQL connections',
			'flightdeck.dbQueryView.running' => 'Running…',
			'flightdeck.dbQueryView.runSelection' => 'Run selection',
			'flightdeck.dbQueryView.run' => 'Run',
			'flightdeck.dbQueryView.pickDatabaseHint' => 'Pick a database above, then Run (⌘↵).',
			'flightdeck.dbQueryView.runQueryHint' => 'Run the query (⌘↵) to see results here.',
			'flightdeck.dbQueryView.noRows' => 'No rows.',
			'flightdeck.dbQueryView.rowsAffected' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '1 row affected', other: '${n} rows affected', ),
			'flightdeck.dbQueryView.rowsFooter' => ({required Object n}) => '${n} rows',
			'flightdeck.dbQueryView.truncatedSuffix' => ' · truncated (raise -- limit)',
			'flightdeck.dbQueryView.table' => 'Table',
			'flightdeck.dbQueryView.json' => 'JSON',
			'flightdeck.dbQueryView.unsaved' => 'unsaved',
			'flightdeck.dbQueryView.saved' => 'saved',
			'flightdeck.dbQueryView.copied' => 'Copied',
			'flightdeck.dbQueryView.copy' => 'Copy',
			'flightdeck.httpView.saveRequestAs' => 'Save request as',
			'flightdeck.httpView.couldNotSave' => 'Could not save',
			'flightdeck.httpView.run' => 'Run',
			'flightdeck.httpView.running' => 'Running…',
			'flightdeck.httpView.noRequests' => 'No request in this file — write one, e.g. GET https://example.com',
			'flightdeck.httpView.selectRequest' => 'Select request',
			'flightdeck.httpView.requestCount' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '1 request', other: '${n} requests', ),
			'flightdeck.httpView.runHint' => 'Run the request (⌘↵) to see the response here.',
			'flightdeck.httpView.emptyBody' => 'Empty response body.',
			'flightdeck.httpView.body' => 'JSON',
			'flightdeck.httpView.headers' => 'Headers',
			'flightdeck.httpView.raw' => 'Text',
			'flightdeck.httpView.truncatedSuffix' => ' · truncated (response too large)',
			'flightdeck.httpView.error.title' => 'Request failed',
			'flightdeck.httpView.error.noRequest' => 'No request found at the cursor.',
			'flightdeck.httpView.error.invalidUrl' => ({required Object url}) => 'Invalid URL: ${url}',
			'flightdeck.httpView.error.unresolvedVariable' => ({required Object name}) => 'Variable {{${name}}} has no value. Declare it with @${name} = … in this file.',
			'flightdeck.httpView.error.bodyFileMissing' => ({required Object path}) => 'Body file not found: ${path}',
			'flightdeck.httpView.error.bodyFileUnreadable' => ({required Object path, required Object detail}) => 'Could not read the body file ${path}: ${detail}',
			'flightdeck.httpView.error.connectionFailed' => ({required Object detail}) => 'Could not reach the server: ${detail}',
			'flightdeck.httpView.error.connectionFailedNoDetail' => 'Could not reach the server.',
			'flightdeck.httpView.error.timeout' => ({required Object seconds}) => 'The request timed out after ${seconds}s.',
			'flightdeck.httpView.error.responseTooLarge' => ({required Object bytes}) => 'The response is larger than the ${bytes} byte limit.',
			'flightdeck.kanbanView.boardView' => 'Board',
			'flightdeck.kanbanView.listView' => 'List',
			'flightdeck.kanbanView.refresh' => 'Refresh from disk',
			'flightdeck.kanbanView.manageLabels' => 'Labels',
			'flightdeck.kanbanView.labelsTitle' => 'Labels in this board',
			'flightdeck.kanbanView.labelNamePlaceholder' => 'label name',
			'flightdeck.kanbanView.labelUsage' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '1 card', other: '${n} cards', ),
			'flightdeck.kanbanView.deleteLabel' => 'Delete label',
			'flightdeck.kanbanView.newCard' => 'new card',
			'flightdeck.kanbanView.newCardTitle' => 'New card',
			'flightdeck.kanbanView.newColumn' => 'New column',
			'flightdeck.kanbanView.columnNameTitle' => 'Column name',
			'flightdeck.kanbanView.dragColumn' => 'Drag column',
			'flightdeck.kanbanView.columnOptions' => 'Column options',
			'flightdeck.kanbanView.renameColumn' => 'Rename column',
			'flightdeck.kanbanView.moveColumnLeft' => 'Move left',
			'flightdeck.kanbanView.moveColumnRight' => 'Move right',
			'flightdeck.kanbanView.deleteColumn' => 'Delete column',
			'flightdeck.kanbanView.newCardHere' => 'New card here',
			'flightdeck.kanbanView.duplicateCard' => 'Duplicate',
			'flightdeck.kanbanView.cardLabels' => 'Labels',
			'flightdeck.kanbanView.deleteCard' => 'Delete card',
			'flightdeck.kanbanView.advance' => 'Move to next column',
			'flightdeck.kanbanView.advanceBack' => 'Move back a column',
			'flightdeck.kanbanView.emptyColumn' => 'No cards',
			'flightdeck.kanbanView.cardCount' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '1 card', other: '${n} cards', ),
			'flightdeck.kanbanView.notes' => 'Note',
			'flightdeck.kanbanView.notesPlaceholder' => 'Write a note',
			'flightdeck.kanbanView.comments' => 'Comments',
			'flightdeck.kanbanView.addComment' => 'Add comment',
			'flightdeck.kanbanView.commentPlaceholder' => 'Write a comment',
			'flightdeck.kanbanView.noComments' => 'No comments yet',
			'flightdeck.kanbanView.closeDetail' => 'Close',
			'flightdeck.kanbanView.notABoard' => 'This file has no ## columns yet — it opens as markdown.',
			'flightdeck.kanbanView.startBoard' => 'Start a board',
			'flightdeck.kanbanView.couldNotSave' => 'Could not save the board',
			'flightdeck.kanbanView.unrecognizedBlock' => 'Not recognized by the parser — drags whole, no inline editing.',
			'flightdeck.kanbanView.deleteColumnDialog.title' => ({required Object name}) => 'Delete “${name}”?',
			'flightdeck.kanbanView.deleteColumnDialog.message' => ({required Object count}) => 'This column has ${count}. Choose what happens to them.',
			'flightdeck.kanbanView.deleteColumnDialog.moveCards' => 'Move to the previous column',
			'flightdeck.kanbanView.deleteColumnDialog.deleteAll' => 'Delete with the column',
			'flightdeck.kanbanView.deleteColumnDialog.emptyMessage' => 'This column is empty.',
			'flightdeck.dbPanel.sectionDatabase' => 'DATABASE',
			'flightdeck.dbPanel.edit' => 'Edit…',
			'flightdeck.dbPanel.copyName' => 'Copy name',
			'flightdeck.dbPanel.newQuery' => 'New query',
			'flightdeck.dbPanel.browseKeys' => 'Browse keys',
			'flightdeck.dbPanel.deleteConnectionTitle' => 'Delete connection',
			'flightdeck.dbPanel.deleteConnectionMessage' => ({required Object name}) => 'Remove "${name}" from this workspace? Any saved password is discarded. .dbq files that reference it are not touched.',
			'flightdeck.dbPanel.footer' => ({required Object n}) => '.flightdeck/databases.json · ${n} connections',
			'flightdeck.dbPanel.footerOne' => '.flightdeck/databases.json · 1 connection',
			'flightdeck.dbPanel.noConnections' => 'No connections yet.',
			'flightdeck.dbPanel.passwordRequired' => 'Password not found on the host. Open this connection and enter it again — it is saved on the machine that runs the database, not on this one.',
			'flightdeck.dbMongoView.deleteDocumentTitle' => 'Delete document',
			'flightdeck.dbMongoView.deleteDocumentMessage' => ({required Object id, required Object collection}) => 'Delete the document with _id ${id} from "${collection}"?',
			'flightdeck.dbMongoView.filterHint' => 'Filter — JSON, e.g. {"status": "active"}',
			'flightdeck.dbMongoView.docCount' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '1 doc', other: '${n} docs', ),
			'flightdeck.dbMongoView.refresh' => 'Refresh',
			'flightdeck.dbMongoView.insertDocument' => 'Insert document',
			'flightdeck.dbMongoView.noDocuments' => 'No documents in this collection.',
			'flightdeck.dbMongoView.noDocumentsMatch' => 'No documents match this filter.',
			'flightdeck.dbMongoView.loadMore' => 'Load more',
			'flightdeck.dbMongoView.edit' => 'Edit',
			'flightdeck.dbMongoView.insert' => 'Insert',
			'flightdeck.dbConnectionDialog.chooseFileTitle' => 'Choose SQLite database',
			'flightdeck.dbConnectionDialog.file' => 'File',
			'flightdeck.dbConnectionDialog.chooseFilePlaceholder' => 'Choose a SQLite file…',
			'flightdeck.dbConnectionDialog.name' => 'Name',
			'flightdeck.dbConnectionDialog.password' => 'Password',
			'flightdeck.dbConnectionDialog.savePassword' => 'Save Password',
			'flightdeck.dbConnectionDialog.allowWrites' => 'Allow writes (agents)',
			'flightdeck.dbConnectionDialog.allowWritesHint' => 'off = agents can only read via CLI',
			'flightdeck.dbConnectionDialog.visibleToAgents' => 'Visible to agents',
			'flightdeck.dbConnectionDialog.visibleToAgentsHint' => 'off = hidden from the CLI, GUI only',
			'flightdeck.dbConnectionDialog.testing' => 'Testing connection…',
			'flightdeck.dbConnectionDialog.connectionOk' => 'Connection OK',
			'flightdeck.dbConnectionDialog.connectionFailed' => 'Connection failed',
			'flightdeck.dbConnectionDialog.editTitle' => 'Edit connection',
			'flightdeck.dbConnectionDialog.newTitle' => 'New connection',
			'flightdeck.dbConnectionDialog.connectionString' => 'Connection string',
			'flightdeck.dbConnectionDialog.invalidUrl' => 'Not a valid connection URL.',
			'flightdeck.dbConnectionDialog.sshTunnel' => 'SSH Tunnel',
			_ => null,
		} ?? switch (path) {
			'flightdeck.dbConnectionDialog.sshHost' => 'SSH Host',
			'flightdeck.dbConnectionDialog.sshPort' => 'SSH Port',
			'flightdeck.dbConnectionDialog.sshUser' => 'SSH User',
			'flightdeck.dbConnectionDialog.privateKey' => 'Private key',
			'flightdeck.dbConnectionDialog.choosePrivateKeyPlaceholder' => 'Choose a private key…',
			'flightdeck.dbConnectionDialog.choosePrivateKeyDialogTitle' => 'Choose SSH private key',
			'flightdeck.dbConnectionDialog.keyPassphrase' => 'Key passphrase',
			'flightdeck.dbConnectionDialog.savePassphrase' => 'Save passphrase',
			'flightdeck.dbConnectionDialog.passwordOnHost' => 'The password is stored on the host, not on this machine.',
			'flightdeck.sshPrompts.unknownSshHostTitle' => 'Unknown SSH host',
			'flightdeck.sshPrompts.neverConnected' => ({required Object endpoint}) => 'FlightDeck has never connected to ${endpoint} before.',
			'flightdeck.sshPrompts.trustHint' => 'Trust it only if this fingerprint matches the server. You can check it on the server with:',
			'flightdeck.sshPrompts.trust' => 'Trust',
			'flightdeck.sshPrompts.sshKeyPassphraseTitle' => 'SSH key passphrase',
			'flightdeck.sshPrompts.unlockMessage' => ({required Object keyPath, required Object connectionName}) => 'Unlock ${keyPath} to connect "${connectionName}".',
			'flightdeck.sshPrompts.keptInMemoryHint' => 'Kept in memory until FlightDeck quits. To let agents use this connection, enable "Save passphrase" in the connection.',
			'flightdeck.sshPrompts.unlock' => 'Unlock',
			'flightdeck.projectsRail.workspaces' => 'Workspaces',
			'flightdeck.projectsRail.newWorkspace' => 'New workspace',
			'flightdeck.projectsRail.settings' => 'Settings',
			'flightdeck.projectsRail.mergeToParent' => 'Merge to Parent',
			'flightdeck.projectsRail.updateFromParent' => 'Update from Parent',
			'flightdeck.projectsRail.forkWorktree' => 'Fork Worktree',
			'flightdeck.projectsRail.copyBranch' => 'Copy branch',
			'flightdeck.projectsRail.remove' => 'Remove',
			'flightdeck.projectsRail.moveToRealm' => 'Move to realm',
			'flightdeck.projectsRail.copyWorkspaceId' => 'Copy workspace id',
			'flightdeck.projectsRail.rename' => 'Rename',
			'flightdeck.projectsRail.close' => 'Close',
			'flightdeck.projectsRail.newRealm' => 'New realm…',
			'flightdeck.projectsRail.manageRealms' => 'Manage realms…',
			'flightdeck.projectsRail.noWorkspaces' => 'No workspaces yet.',
			'flightdeck.projectsRail.sync' => 'Sync',
			'flightdeck.projectsRail.pull' => 'Pull',
			'flightdeck.projectsRail.push' => 'Push',
			'flightdeck.projectsRail.createWorktree' => 'Create worktree',
			'flightdeck.projectsRail.worktreeCount' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '1 worktree', other: '${n} worktrees', ),
			'flightdeck.projectsRail.expandWorktrees' => 'Expand worktrees',
			'flightdeck.projectsRail.collapseWorktrees' => 'Collapse worktrees',
			'flightdeck.findBar.find' => 'Find',
			'flightdeck.findBar.matchCase' => 'Match case',
			'flightdeck.findBar.wholeWord' => 'Whole word',
			'flightdeck.findBar.useRegex' => 'Use regular expression',
			'flightdeck.findBar.previous' => 'Previous (⇧⏎)',
			'flightdeck.findBar.next' => 'Next (⏎)',
			'flightdeck.findBar.close' => 'Close (Esc)',
			'flightdeck.findBar.badPattern' => 'Bad pattern',
			'flightdeck.findBar.noResults' => 'No results',
			'flightdeck.contentSearch.sectionSearch' => 'SEARCH',
			'flightdeck.contentSearch.searchInFiles' => 'Search in files',
			'flightdeck.contentSearch.matchCase' => 'Match case',
			'flightdeck.contentSearch.wholeWord' => 'Whole word',
			'flightdeck.contentSearch.useRegex' => 'Use regular expression',
			'flightdeck.contentSearch.invalidRegex' => 'Invalid regular expression.',
			'flightdeck.contentSearch.typeToSearch' => 'Type to search across files.',
			'flightdeck.contentSearch.searching' => 'Searching…',
			'flightdeck.contentSearch.noResults' => 'No results.',
			'flightdeck.emptyPane.newAgent' => 'New agent',
			'flightdeck.emptyPane.newAgentDescription' => 'Runs a pi in the folder you choose',
			'flightdeck.emptyPane.newTerminal' => 'New terminal',
			'flightdeck.emptyPane.newTerminalDescription' => 'Opens a shell in the folder you choose',
			'flightdeck.topbar.collapseSidebar' => 'Collapse sidebar',
			'flightdeck.topbar.toggleFiles' => 'Show/hide files',
			'flightdeck.topbar.filesUnavailable' => 'Files unavailable in FlightDeck',
			'flightdeck.topbar.hideKeyboard' => 'Hide keyboard',
			'flightdeck.transcript.cancel' => 'Cancel',
			'flightdeck.transcript.send' => 'Send',
			'flightdeck.transcript.typeYourAnswer' => 'Type your answer',
			'flightdeck.transcript.startHint' => 'Send a prompt to get the agent started.',
			'flightdeck.transcript.workedFor' => ({required Object duration}) => 'Worked for ${duration}',
			'flightdeck.tasks.hotReload' => 'Hot reload',
			'flightdeck.tasks.hotRestart' => 'Hot restart',
			'flightdeck.tasks.toggleDebugPaint' => 'Toggle debug paint',
			'flightdeck.tasks.togglePlatform' => 'Toggle platform',
			'flightdeck.tasks.quit' => 'Quit',
			'flightdeck.notifications.agentFinished' => 'Agent finished',
			'flightdeck.notifications.open' => 'Open',
			'flightdeck.notifications.agentNeedsAction' => 'Agent needs your input',
			'flightdeck.notifications.agentCrashed' => 'Agent stopped unexpectedly',
			'flightdeck.terminal.cwdFallbackWarning' => ({required Object requested, required Object path}) => 'Warning: the folder "${requested}" does not exist. This terminal opened in "${path}".',
			'flightdeck.remoteHost.addHost' => 'Add remote host',
			'flightdeck.remoteHost.hostName' => 'Name',
			'flightdeck.remoteHost.sshTarget' => 'SSH target (user@host)',
			'flightdeck.remoteHost.connecting' => ({required Object host}) => 'Connecting to ${host}…',
			'flightdeck.remoteHost.openingTunnel' => 'SSH tunnel',
			'flightdeck.remoteHost.installingServer' => 'Installing server',
			'flightdeck.remoteHost.handshake' => ({required Object version}) => 'Server ${version}',
			'flightdeck.remoteHost.loadingWorkspace' => 'Loading workspace…',
			'flightdeck.remoteHost.reconnecting' => ({required Object host}) => 'Reconnecting to ${host}…',
			'flightdeck.remoteHost.offline' => ({required Object host}) => '${host} offline',
			'flightdeck.remoteHost.remove' => 'Remove',
			'flightdeck.remoteHost.reconnect' => 'Reconnect',
			'flightdeck.remoteHost.installServer' => 'Install server',
			'flightdeck.remoteHost.errSshUnreachable' => ({required Object host}) => 'Cannot reach ${host} over SSH. Is it on, and is Remote Login enabled?',
			'flightdeck.remoteHost.errInstallFailed' => ({required Object host}) => 'Could not install the server on ${host}.',
			'flightdeck.remoteHost.errVersionMismatch' => 'Server version incompatible; update it.',
			'flightdeck.remoteHost.errDetail' => ({required Object detail}) => 'Details: ${detail}',
			'flightdeck.remoteHost.pickFolderTitle' => ({required Object host}) => 'Open folder on ${host}',
			'flightdeck.remoteHost.openHere' => 'Open here',
			'flightdeck.remoteHost.emptyFolder' => 'No subfolders',
			'flightdeck.remoteHost.newLocal' => 'Local',
			'flightdeck.remoteHost.newRemote' => 'Remote',
			'flightdeck.remoteHost.chooseHost' => 'Choose a host',
			'flightdeck.remoteHost.newHostEntry' => 'New host…',
			'flightdeck.remoteHost.editHost' => 'Edit host',
			'flightdeck.remoteHost.userLabel' => 'Username',
			'flightdeck.remoteHost.hostLabel' => 'Host / IP',
			'flightdeck.remoteHost.portLabel' => 'Port',
			'flightdeck.remoteHost.authLabel' => 'Authentication',
			'flightdeck.remoteHost.authKey' => 'SSH key',
			'flightdeck.remoteHost.authPassword' => 'Password',
			'flightdeck.remoteHost.passwordLabel' => 'Password',
			'flightdeck.remoteHost.passwordKeep' => 'Leave blank to keep current',
			'flightdeck.remoteHost.errUser' => 'Username required',
			'flightdeck.remoteHost.errHost' => 'Host required',
			'flightdeck.remoteHost.errPassword' => 'Password required',
			'flightdeck.remoteHost.identityChoose' => 'Choose…',
			'flightdeck.remoteHost.identityEmpty' => 'No key selected',
			'flightdeck.remoteHost.identityDialogTitle' => 'Select the SSH private key',
			'flightdeck.remoteHost.errIdentity' => 'Pick the private key to authenticate with.',
			'flightdeck.remoteHost.errHostKeyUnknown' => ({required Object host}) => 'FlightDeck does not trust ${host} yet. Connect again and confirm the fingerprint.',
			'flightdeck.remoteHost.errHostKeyChanged' => ({required Object host}) => '${host} is presenting a different SSH key than the one stored. If you did not reinstall that machine, stop and check it — otherwise remove the old entry from ~/.ssh/known_hosts.',
			'flightdeck.remoteHost.errHostBundleMissing' => ({required Object host}) => '${host} runs Windows but does not have FlightDeck installed. The remote server is installed from the FlightDeck bundle already on that machine, so install FlightDeck there and try again.',
			'flightdeck.remoteHost.errHostUnknownOs' => ({required Object host}) => 'Could not identify the operating system of ${host}. The account may have a restricted shell, or no shell at all.',
			'flightdeck.remoteHost.errIdentityPublic' => 'Only the public key is here. That works only if the private key is in your SSH agent; otherwise pick the private file (same name, without .pub).',
			'flightdeck.remoteHost.errIdentityNotKey' => 'That file does not look like a private key.',
			'flightdeck.remoteHost.errIdentityMissingFile' => 'That file no longer exists.',
			'flightdeck.remoteHost.errIdentityUnreadable' => 'That file could not be read.',
			'flightdeck.browserPane.back' => 'Back',
			'flightdeck.browserPane.forward' => 'Forward',
			'flightdeck.browserPane.reload' => 'Reload',
			'flightdeck.browserPane.urlHint' => 'Enter URL or address',
			'flightdeck.browserPane.go' => 'Go',
			'flightdeck.gallery.intro' => 'Special FlightDeck documents that give you a visual of what the AI agent is doing.',
			'flightdeck.gallery.createErrorTitle' => 'Could not create the file',
			'flightdeck.gallery.dbQuery.title' => 'Database query',
			'flightdeck.gallery.dbQuery.description' => 'SQL editor with a result grid, using one of the registered connections.',
			'flightdeck.gallery.kanban.title' => 'Kanban board',
			'flightdeck.gallery.kanban.description' => 'Columns and cards stored as plain markdown. Drag, edit and comment.',
			'flightdeck.gallery.layout.title' => 'Pane layout',
			'flightdeck.gallery.layout.description' => 'Terminals and splits to open in one go, like tmuxinator. Can run automatically on new worktrees.',
			'flightdeck.gallery.httpRequest.title' => 'HTTP requests',
			'flightdeck.gallery.httpRequest.description' => 'Write requests in a file and run them with the response next to it.',
			'flightdeck.gallery.html.title' => 'HTML view',
			'flightdeck.gallery.html.description' => 'A page the agent writes and FlightDeck renders directly: mind maps, diagrams, charts, whatever you need.',
			'flightdeck.gallery.tasks.title' => 'Tasks',
			'flightdeck.gallery.tasks.description' => 'Commands to run from the Tasks panel, such as the dev server, tests and build. Stored in .flightdeck/tasks.json.',
			'flightdeck.gallery.notebook.title' => 'Notebook',
			'flightdeck.gallery.notebook.description' => 'A folder of short notes with tags. The agent writes, you read and edit. Also opens in Obsidian.',
			'flightdeck.notebook.notes' => 'Notes',
			'flightdeck.notebook.newNote' => 'New note',
			'flightdeck.notebook.searchPlaceholder' => 'Search notes',
			'flightdeck.notebook.empty' => 'No notes yet. Create one, or ask the agent to write here.',
			'flightdeck.notebook.noMatch' => 'No note matches.',
			'flightdeck.notebook.selectNote' => 'Select a note',
			'flightdeck.notebook.reload' => 'Reload from disk',
			'flightdeck.notebook.untagged' => 'untagged',
			'flightdeck.notebook.saveFailed' => 'Could not save the note',
			'flightdeck.notebook.createFailed' => 'Could not create the note',
			'flightdeck.notebook.addTag' => 'add tag',
			'flightdeck.notebook.untitled' => 'Untitled',
			'flightdeck.notebook.deleteNote' => 'Delete note',
			'flightdeck.notebook.deleteConfirm' => ({required Object name}) => 'Move “${name}” to the trash?',
			'flightdeck.notebook.imageFailed' => 'Could not save the image',
			'flightdeck.notebook.format.bold' => 'Bold (⌘B)',
			'flightdeck.notebook.format.italic' => 'Italic (⌘I)',
			'flightdeck.notebook.format.strike' => 'Strikethrough',
			'flightdeck.notebook.format.heading1' => 'Heading 1',
			'flightdeck.notebook.format.heading2' => 'Heading 2',
			'flightdeck.notebook.format.heading3' => 'Heading 3',
			'flightdeck.notebook.format.bullets' => 'Bullet list',
			'flightdeck.notebook.format.numbered' => 'Numbered list',
			'flightdeck.notebook.format.checklist' => 'Checklist',
			'flightdeck.notebook.format.quote' => 'Quote',
			'flightdeck.notebook.format.code' => 'Inline code (⌘E)',
			'flightdeck.notebook.format.codeBlock' => 'Code block',
			'flightdeck.notebook.format.link' => 'Link (⌘K)',
			'flightdeck.notebook.format.rule' => 'Divider',
			'flightdeck.notebook.format.noteLink' => 'Link to a note ([[…]])',
			'flightdeck.notebook.format.noteLinkSearch' => 'Search notes',
			'flightdeck.notebook.format.image' => 'Insert image…',
			'flightdeck.notebook.backlinks' => 'Linked from',
			'flightdeck.notebook.renameTag' => 'Rename tag',
			'flightdeck.notebook.deleteTag' => 'Delete tag',
			'flightdeck.notebook.deleteTagConfirm' => ({required Object name, required Object count}) => 'Remove “${name}” from ${count} notes? The notes stay.',
			'flightdeck.notebook.showList' => 'Show notes list',
			'flightdeck.notebook.hideList' => 'Hide notes list',
			'settings.language.title' => 'Language',
			'settings.language.system' => 'System',
			'settings.language.english' => 'English',
			'settings.language.portugueseBr' => 'Português (BR)',
			'settings.language.spanish' => 'Español',
			'settings.revokeDialog.deviceRemoved' => 'Device removed.',
			'settings.revokeDialog.failedToRevoke' => 'Failed to revoke the device.',
			'settings.revokeDialog.revoking' => 'Revoking…',
			'settings.revokeDialog.revokingDevice' => ({required Object name}) => 'Revoking ${name}…',
			'settings.revokeDialog.connectingMessage' => 'Connecting to the relay and removing access.',
			'settings.revokeDialog.ok' => 'Ok',
			'settings.pairingDialog.title' => 'Pair device',
			'settings.pairingDialog.connectingToRelay' => 'Connecting to the relay…',
			'settings.pairingDialog.step1' => 'Open the Remote Pi app on your phone.',
			'settings.pairingDialog.step2' => 'Tap add / pair device.',
			'settings.pairingDialog.step3' => 'Point the camera at the QR below.',
			'settings.pairingDialog.qrGenerationFailed' => 'Could not generate the QR.',
			'settings.pairingDialog.autoRefreshHint' => 'The code refreshes on its own. Keep this window open.',
			'settings.pairingDialog.pairingFailed' => 'Pairing failed.',
			'settings.pairingDialog.tryAgain' => 'Try again',
			'settings.pairingDialog.copied' => 'Copied!',
			'settings.pairingDialog.copyData' => 'Copy data',
			'settings.page.header.back' => 'Back',
			'settings.page.header.title' => 'Settings',
			'settings.page.nav.general' => 'General',
			'settings.page.nav.appearance' => 'Appearance',
			'settings.page.nav.terminal' => 'Terminal',
			'settings.page.nav.language' => 'Language',
			'settings.page.nav.shortcuts' => 'Shortcuts',
			'settings.page.nav.notifications' => 'Notifications',
			'settings.page.nav.connectivity' => 'Connectivity',
			'settings.page.nav.daemonAgents' => 'Daemon Agents',
			'settings.page.nav.schedules' => 'Schedules',
			'settings.page.nav.automations' => 'Automations',
			'settings.page.nav.remoteHosts' => 'Remote hosts',
			'settings.page.general.sectionAgent' => 'Agent',
			'settings.page.general.enableAgentsTitle' => 'Enable agents',
			'settings.page.general.enableAgentsDesc' => 'Show the option to open agent tabs (pi). When off, FlightDeck works as a terminal-only workspace.',
			'settings.page.general.showFlightDeckTitle' => 'Show FlightDeck terminal',
			'settings.page.general.showFlightDeckDesc' => 'Keep a pathless, terminal-only workspace pinned at the top of the rail. Turning it off closes its terminals.',
			'settings.page.general.launchAtStartupTitle' => 'Launch at login',
			'settings.page.general.launchAtStartupDesc' => 'Start FlightDeck automatically when you sign in to your computer.',
			'settings.page.general.sectionUpdates' => 'Updates',
			'settings.page.general.checkUpdatesTitle' => 'Check for updates',
			'settings.page.general.checkUpdatesDesc' => 'How often FlightDeck should look for new versions.',
			'settings.page.general.agentsInUseError' => 'Can\'t turn agents off while an agent tab is open. Close all agent tabs first, then disable it.',
			'settings.page.general.updateFrequency.daily' => 'Daily',
			'settings.page.general.updateFrequency.weekly' => 'Weekly',
			'settings.page.general.updateFrequency.monthly' => 'Monthly',
			'settings.page.general.updateFrequency.never' => 'Never',
			'settings.page.diagnostics.sectionTitle' => 'Diagnostics',
			'settings.page.diagnostics.logFileTitle' => 'Log file',
			'settings.page.diagnostics.logFileDesc' => ({required Object days, required Object path}) => 'Errors and startup events are recorded here, kept for ${days} days.\n${path}',
			'settings.page.diagnostics.unavailable' => 'unavailable',
			'settings.page.diagnostics.reveal' => 'Reveal',
			'settings.page.diagnostics.reportTitle' => 'Report a problem',
			'settings.page.diagnostics.reportDesc' => 'Opens a pre-filled issue with your version, OS and recent log. Nothing is sent automatically — you review it first.',
			'settings.page.diagnostics.reportButton' => 'Report…',
			'settings.page.diagnostics.reportDialogTitle' => 'Problem report',
			'settings.page.diagnostics.reportDialogError' => 'Reported manually from Settings.',
			'settings.page.diagnostics.reportDialogDescription' => 'Describe what went wrong in the issue. The recent log is included below and in "Copy details".',
			'settings.page.storage.sectionTitle' => 'Storage',
			'settings.page.storage.locationTitle' => 'Storage location',
			'settings.page.storage.locationDesc' => ({required Object root}) => 'FlightDeck keeps its projects, layouts and settings here. Point it at a synced folder to back it up.\n${root}',
			'settings.page.storage.useDefault' => 'Use default',
			'settings.page.storage.working' => 'Working…',
			'settings.page.storage.change' => 'Change…',
			'settings.page.storage.resetTitle' => 'Reset FlightDeck',
			'settings.page.storage.resetDesc' => 'Delete all local data — projects, layouts, settings and terminal history — and return to the default location.',
			'settings.page.storage.resetButton' => 'Reset…',
			'settings.page.storage.resetConfirm' => 'Reset',
			'settings.page.storage.resetDialogTitle' => 'Reset FlightDeck?',
			'settings.page.storage.resetDialogContent' => 'This permanently deletes all local FlightDeck data — projects, layouts, settings and terminal history. This cannot be undone. FlightDeck will close so you can start fresh.',
			'settings.page.storage.restartRequiredTitle' => 'Restart required',
			'settings.page.storage.restartChangeFolderMessage' => ({required Object path}) => 'FlightDeck will use this folder from the next launch:\n${path}',
			'settings.page.storage.restartUseDefaultMessage' => 'FlightDeck will use the default system location from the next launch. Your data in the custom folder is left untouched.',
			'settings.page.storage.restartResetMessage' => 'All FlightDeck data was cleared. Restart to start fresh.',
			'settings.page.storage.later' => 'Later',
			'settings.page.storage.quitFlightDeck' => 'Quit FlightDeck',
			'settings.page.storage.chooseFolderDialogTitle' => 'Choose a folder for FlightDeck data',
			'settings.page.terminal.sectionDefaultTerminal' => 'Default terminal',
			'settings.page.terminal.engineTitle' => 'Engine',
			'settings.page.terminal.engineDesc' => 'Used by new terminal tabs and task output buffers. Open tabs keep their current engine.',
			'settings.page.terminal.shellTitle' => 'Shell',
			'settings.page.terminal.shellDesc' => 'Which shell new terminal tabs open. The arrow next to + still opens any other one, just for that tab.',
			'settings.page.terminal.noWslMessage' => 'No WSL distros found. Install one (wsl.exe --install) and restart FlightDeck to see it listed here.',
			'settings.page.appearance.sectionTheme' => 'Theme',
			'settings.page.appearance.themeTitle' => 'Theme',
			'settings.page.appearance.themeDesc' => 'App colors, code highlighting and terminal palette.',
			'settings.page.appearance.modeTitle' => 'Mode',
			'settings.page.appearance.modeDesc' => 'Which variant of the theme to use.',
			'settings.page.appearance.modeOnlyDark' => ({required Object theme}) => '"${theme}" only ships a dark variant, so this has no effect.',
			'settings.page.appearance.modeOnlyLight' => ({required Object theme}) => '"${theme}" only ships a light variant, so this has no effect.',
			'settings.page.appearance.themeFileTitle' => 'Theme file',
			'settings.page.appearance.themeFileDesc' => 'Import a theme from a JSON file, or export the active one.',
			'settings.page.appearance.previewCode' => 'Code',
			'settings.page.appearance.previewTerminal' => 'Terminal',
			'settings.page.appearance.themeSystem' => 'System',
			'settings.page.appearance.themeLight' => 'Light',
			'settings.page.appearance.themeDark' => 'Dark',
			'settings.page.appearance.sectionFonts' => 'Fonts',
			'settings.page.appearance.interfaceFontTitle' => 'Interface font',
			'settings.page.appearance.interfaceFontDesc' => 'Used across the whole app. Empty = system default.',
			'settings.page.appearance.interfaceSizeTitle' => 'Interface size',
			'settings.page.appearance.codeFontTitle' => 'Code font',
			'settings.page.appearance.codeFontDesc' => 'Code and diffs. Empty = system default.',
			'settings.page.appearance.codeSizeTitle' => 'Code size',
			'settings.page.appearance.terminalFontTitle' => 'Terminal font',
			'settings.page.appearance.terminalFontDesc' => 'Terminal only. Empty = system default.',
			'settings.page.appearance.terminalSizeTitle' => 'Terminal size',
			'settings.page.appearance.terminalSizeDesc' => 'Off = follows the code size.',
			'settings.page.appearance.terminalSizeInherit' => 'Follow code size',
			'settings.page.appearance.terminalWeightTitle' => 'Terminal weight',
			'settings.page.appearance.terminalWeightDesc' => 'Low-density screens render strokes heavier. Auto lightens them there and leaves Retina untouched.',
			'settings.page.appearance.terminalWeightAuto' => 'Auto (by screen)',
			'settings.page.appearance.terminalWeightLight' => 'Light',
			'settings.page.appearance.terminalWeightNormal' => 'Normal',
			'settings.page.appearance.terminalWeightMedium' => 'Medium',
			'settings.page.appearance.terminalWeightSemiBold' => 'Semibold',
			'settings.page.appearance.sectionConversation' => 'Conversation',
			'settings.page.appearance.pinUserMessageTitle' => 'Pin user message',
			'settings.page.appearance.pinUserMessageDesc' => 'The question stays fixed at the top while the answer scrolls.',
			'settings.page.appearance.importTheme' => 'Import…',
			'settings.page.appearance.exportTheme' => 'Export…',
			'settings.page.appearance.deleteTheme' => 'Remove',
			'settings.page.appearance.importThemeDialog' => 'Pick a theme file',
			'settings.page.appearance.exportThemeDialog' => 'Save theme as',
			'settings.page.appearance.themeImported' => ({required Object name}) => 'Theme "${name}" imported.',
			'settings.page.appearance.themeExported' => 'Theme saved.',
			'settings.page.appearance.themeDeleted' => 'Theme removed.',
			'settings.page.appearance.fontPickerTitle' => 'Choose a font',
			'settings.page.appearance.fontPickerSearch' => 'Search fonts',
			'settings.page.appearance.fontPickerEmpty' => 'No matching font found on this machine.',
			'settings.page.appearance.fontPickerBundled' => 'included',
			'settings.page.appearance.fontPickerCustom' => 'Not listed? Type the exact family name.',
			'settings.page.appearance.fontPickerCustomHint' => 'Family name',
			'settings.page.appearance.fontPickerUse' => 'Use',
			'settings.page.appearance.fontPickerDefault' => 'Default',
			'settings.page.appearance.fontMissing' => 'Not found on this machine — falling back.',
			'settings.page.appearance.sectionLayout' => 'Layout',
			'settings.page.appearance.swapPanelsTitle' => 'Swap side panels',
			'settings.page.appearance.swapPanelsDesc' => 'Puts workspaces on the right and files, search, git and database on the left.',
			'settings.page.notifications.sectionTitle' => 'Notifications',
			'settings.page.notifications.enableTitle' => 'Enable notifications',
			'settings.page.notifications.enableDesc' => 'Alert me when an agent finishes a turn and the window is not focused.',
			'settings.page.notifications.systemPermissionTitle' => 'System permission',
			'settings.page.notifications.grantedDesc' => 'FlightDeck is allowed to send notifications.',
			'settings.page.notifications.notGrantedDesc' => 'macOS has not granted notification access yet.',
			'settings.page.notifications.granted' => 'Granted',
			'settings.page.notifications.requestPermission' => 'Request permission',
			'settings.page.notifications.soundsTitle' => 'Sounds',
			'settings.page.notifications.soundVolumeTitle' => 'Volume',
			'settings.page.notifications.soundTurnDone' => 'Turn completed',
			'settings.page.notifications.soundTurnDoneDesc' => 'An agent finished its turn.',
			'settings.page.notifications.soundActionRequired' => 'Action required',
			'settings.page.notifications.soundActionRequiredDesc' => 'An agent is waiting for your approval or answer.',
			'settings.page.notifications.soundAgentError' => 'Agent error',
			'settings.page.notifications.soundAgentErrorDesc' => 'An agent process stopped unexpectedly.',
			'settings.page.notifications.soundDefault' => 'Default',
			'settings.page.notifications.soundCustom' => ({required Object name}) => 'Custom: ${name}',
			'settings.page.notifications.soundChooseFile' => 'Choose file',
			'settings.page.notifications.soundReset' => 'Reset to default',
			'settings.page.notifications.soundOnActiveTab' => 'Also play when this tab is active',
			'settings.page.notifications.soundPreview' => 'Preview',
			'settings.page.shortcuts.notCustomizable' => 'Keyboard shortcuts are not customizable yet.',
			'settings.page.languages.sectionFormatting' => 'FORMATTING',
			'settings.page.languages.formatOnSaveTitle' => 'Format on save',
			'settings.page.languages.formatOnSaveDesc' => 'Format the file automatically when you save (⌘S).',
			'settings.page.languages.sectionLanguageServers' => 'LANGUAGE SERVERS',
			'settings.page.languages.footerNote' => 'Errors and formatting use each language\'s language server. FlightDeck does not install servers — it uses what is already on your machine. ● responds · ○ not found or invalid command (install the server or adjust the command).',
			'settings.page.languages.serverCommandLabel' => 'Language server command',
			'settings.page.languages.formatterCommandLabel' => 'Formatter command (optional)',
			'settings.page.languages.formatterHint' => 'External formatter with %FILE% placeholder. Takes precedence over the LSP formatter when set.',
			'settings.page.languages.resetToDefault' => 'Reset to default',
			'settings.page.languages.saveAndRestart' => 'Save & restart',
			'settings.page.languages.statusResponds' => 'Server responds',
			'settings.page.languages.statusNotFound' => 'Server not found or command invalid',
			'settings.page.connectivity.sectionRelay' => 'Relay',
			'settings.page.connectivity.sectionPairedDevices' => 'Paired devices',
			'settings.page.connectivity.reloadTooltip' => 'Reload',
			'settings.page.connectivity.failedToListDevices' => 'Failed to list devices.',
			'settings.page.connectivity.noPairedDevices' => 'No paired devices.',
			'settings.page.connectivity.relayAddressTitle' => 'Relay address',
			'settings.page.connectivity.relayAddressDesc' => 'Server that connects your agents to the phone. Applies to every agent with the relay enabled.',
			'settings.page.connectivity.saving' => 'Saving…',
			'settings.page.connectivity.check' => 'Check',
			'settings.page.connectivity.healthOnline' => 'Online',
			'settings.page.connectivity.healthNoResponse' => 'No response',
			'settings.page.connectivity.healthNotChecked' => 'Not checked',
			'settings.page.connectivity.deviceDefaultLabel' => 'Device',
			'settings.page.connectivity.revoke' => 'Revoke',
			'settings.page.connectivity.pairNewDevice' => 'Pair new device',
			'settings.page.connectivity.revokeDialogTitle' => 'Revoke device?',
			'settings.page.connectivity.revokeDialogContent' => ({required Object name}) => '"${name}" will lose access to your agents and will need to pair again.\n\nYou must be connected to the relay — the app will connect automatically to revoke.',
			'settings.page.schedules.sectionScheduledPrompts' => 'Scheduled prompts',
			'settings.page.schedules.createSchedule' => 'Create schedule',
			'settings.page.schedules.createDaemonFirst' => 'Create a Daemon Agent first.',
			'settings.page.schedules.supervisorOffline' => 'Supervisor offline. Schedules need pi-supervisord running (`remote-pi install`).',
			'settings.page.schedules.failedToListSchedules' => 'Failed to list schedules.',
			'settings.page.schedules.noSchedules' => 'No schedules. Create a recurring prompt for a daemon.',
			'settings.page.schedules.runNow' => 'Run now',
			'settings.page.schedules.viewLog' => 'View log',
			'settings.page.schedules.disabled' => 'disabled',
			'settings.page.schedules.nextRun' => ({required Object when}) => 'next ${when}',
			'settings.page.schedules.lastRun' => ({required Object label}) => 'last: ${label}',
			'settings.page.schedules.removeScheduleDialogTitle' => 'Remove schedule?',
			'settings.page.schedules.removeScheduleDialogContent' => ({required Object schedule, required Object daemon}) => 'The job "${schedule}" for ${daemon} is deleted. Its runs stop.',
			'settings.page.schedules.newScheduleTitle' => 'New schedule',
			'settings.page.schedules.daemonLabel' => 'Daemon',
			'settings.page.schedules.whenLabel' => 'When (cron expression)',
			'settings.page.schedules.previewPlaceholder' => 'Next run shows up here',
			'settings.page.schedules.previewComputed' => 'Next: computed on save',
			'settings.page.schedules.previewNext' => ({required Object when}) => 'Next: ${when}',
			'settings.page.schedules.exampleEveryDay9am' => 'every day 9am',
			'settings.page.schedules.exampleHourly' => 'hourly',
			'settings.page.schedules.exampleEvery15Min' => 'every 15 min',
			'settings.page.schedules.exampleWeekdays6pm' => 'weekdays 6pm',
			'settings.page.schedules.promptLabel' => 'Prompt',
			'settings.page.schedules.timezoneLabel' => 'Timezone (optional)',
			'settings.page.schedules.skipIfBusy' => 'Skip if the agent is busy',
			'settings.page.schedules.wakeIfStopped' => 'Wake the daemon if stopped',
			'settings.page.schedules.catchup' => 'Recover 1 missed run (catchup)',
			'settings.page.schedules.fillRequiredError' => 'Fill in the expression and the prompt.',
			'settings.page.schedules.creating' => 'Creating…',
			'settings.page.schedules.failedToCreateSchedule' => 'Failed to create the schedule.',
			'settings.page.schedules.historyTitle' => ({required Object schedule}) => 'History — ${schedule}',
			'settings.page.schedules.failedToReadLog' => 'Failed to read the log.',
			'settings.page.schedules.noRecordsYet' => 'No records yet.',
			'settings.page.schedules.cronDelivered' => 'delivered',
			'settings.page.schedules.cronWokeDelivered' => 'woke + delivered',
			'settings.page.schedules.cronFailed' => 'failed',
			'settings.page.schedules.cronSkippedBusy' => 'skipped (busy)',
			'settings.page.schedules.cronSkippedStopped' => 'skipped (stopped)',
			'settings.page.schedules.cronSkippedDisabled' => 'skipped (disabled)',
			'settings.page.daemons.sectionAlwaysOnAgents' => 'Always-on agents',
			'settings.page.daemons.createDaemon' => 'Create daemon',
			'settings.page.daemons.startAll' => 'Start all',
			'settings.page.daemons.stopAll' => 'Stop all',
			'settings.page.daemons.restartAll' => 'Restart all',
			'settings.page.daemons.restartSupervisor' => 'Restart supervisor',
			'settings.page.daemons.restartSupervisorDialogTitle' => 'Restart the supervisor?',
			'settings.page.daemons.restartSupervisorDialogContent' => 'Restarts the supervisor process (reloads the code). All daemons restart with it and go offline for a few seconds.',
			'settings.page.daemons.removeDaemonDialogTitle' => 'Remove daemon?',
			'settings.page.daemons.removeDaemonDialogContent' => ({required Object name}) => '"${name}" stops running and leaves the registry. The folder and its local config are kept — you can recreate it later.',
			'settings.page.daemons.supervisorOfflineTitle' => 'Supervisor offline',
			'settings.page.daemons.supervisorOfflineDesc' => 'pi-supervisord is not running. Install it with `remote-pi install` to manage 24/7 agents.',
			'settings.page.daemons.failedToListDaemons' => 'Failed to list daemons.',
			'settings.page.daemons.noRegisteredAgents' => 'No registered agents. Create one from a folder.',
			'settings.page.daemons.start' => 'Start',
			'settings.page.daemons.stop' => 'Stop',
			'settings.page.daemons.edit' => 'Edit',
			'settings.page.daemons.stateRunning' => 'running',
			'settings.page.daemons.stateStarting' => 'starting',
			'settings.page.daemons.stateStopped' => 'stopped',
			'settings.page.daemons.stateFailed' => 'failed',
			'settings.page.daemons.newDaemonTitle' => 'New daemon',
			'settings.page.daemons.editDaemonTitle' => 'Edit daemon',
			'settings.page.daemons.nameLabel' => 'Name',
			'settings.page.daemons.namePlaceholder' => 'e.g. PC, Server, Home',
			'settings.page.daemons.nameRequiredError' => 'Enter a name.',
			'settings.page.daemons.nameDuplicateError' => 'An agent with this name already exists.',
			'settings.page.daemons.folderLabel' => 'Folder',
			'settings.page.daemons.noFolderChosen' => 'No folder chosen',
			'settings.page.daemons.choose' => 'Choose',
			'settings.page.daemons.changeFolder' => 'Change',
			'settings.page.daemons.folderCannotBeChanged' => 'The folder cannot be changed.',
			'settings.page.daemons.folderRequiredError' => 'Choose a folder.',
			'settings.page.daemons.folderDuplicateError' => 'An agent already exists in this folder.',
			'settings.page.daemons.pickFolderDialogTitle' => 'Choose the Daemon Agent folder',
			'settings.page.automations.sectionCommitMessages' => 'Commit messages',
			'settings.page.automations.harness' => 'Harness',
			'settings.page.automations.harnessDiscovering' => 'Looking for installed command-line harnesses…',
			'settings.page.automations.harnessNoneFound' => 'No supported harness was found on PATH.',
			'settings.page.automations.harnessConfiguredUnavailable' => ({required Object harness}) => '${harness} is configured but unavailable.',
			'settings.page.automations.harnessChoose' => 'Choose the CLI used to generate commit messages.',
			'settings.page.automations.harnessRefresh' => 'Refresh installed harnesses',
			'settings.page.automations.notConfigured' => 'Not configured',
			'settings.page.automations.model' => 'Model',
			'settings.page.automations.modelUnavailable' => 'The model list is unavailable until the harness is found.',
			'settings.page.automations.modelCliOnly' => 'This harness uses its CLI default model.',
			'settings.page.automations.modelCliDefault' => 'CLI default',
			'settings.page.automations.modelAuto' => 'Auto',
			'settings.page.automations.modelSearch' => ({required Object count}) => 'Search among ${count} models…',
			'settings.page.automations.modelAutoRouted' => 'This harness routes the model automatically.',
			'settings.page.automations.modelAccountOnly' => 'Only models your account can use are listed.',
			'settings.page.automations.generateFromSourceControl' => 'Generate from Source Control',
			'settings.page.automations.generateFromSourceControlDescription' => 'FlightDeck sends only the selected diff and recent commit subjects. Common credential patterns and sensitive files are redacted before the harness runs.',
			'settings.page.automations.discoveryFailed' => 'Could not discover installed automation harnesses.',
			'settings.page.automations.staleModel' => ({required Object model, required Object harness}) => 'Model "${model}" is no longer available for ${harness}. Using the CLI default — pick another model in Settings if needed.',
			'settings.page.automations.recommendedSuffix' => 'Recommended',
			'settings.remoteHosts.title' => 'Remote hosts',
			'settings.remoteHosts.description' => 'Machines you reach over SSH. Adding a host here is the same as adding one from the workspace "+" menu.',
			'settings.remoteHosts.empty' => 'No remote hosts yet.',
			'settings.remoteHosts.add' => 'Add host',
			'settings.remoteHosts.edit' => 'Edit',
			'settings.remoteHosts.reconnect' => 'Reconnect',
			'settings.remoteHosts.remove' => 'Remove',
			'settings.remoteHosts.removeTitle' => 'Remove host',
			'settings.remoteHosts.removeMessage' => ({required Object name}) => 'Remove "${name}" and all its workspaces? Nothing is deleted on the host itself.',
			'settings.remoteHosts.workspacesCount' => ({required Object count}) => '${count} workspace(s)',
			'settings.remoteHosts.deviceKeyTitle' => 'This device\'s key',
			'settings.remoteHosts.deviceKeyDesc' => 'Add this public key to ~/.ssh/authorized_keys on the host so this device can connect.',
			'settings.remoteHosts.deviceKeyCopy' => 'Copy public key',
			'settings.remoteHosts.deviceKeyCopied' => 'Public key copied',
			'settings.remoteHosts.statusConnected' => 'Connected',
			'settings.remoteHosts.statusConnecting' => 'Connecting…',
			'settings.remoteHosts.statusReconnecting' => 'Reconnecting…',
			'settings.remoteHosts.statusOffline' => 'Offline',
			'settings.remoteHosts.statusIdle' => 'Not connected',
			'settings.remoteHosts.helpTitle' => 'How it works',
			'settings.remoteHosts.helpBody' => 'FlightDeck connects to your machine over SSH and talks to a small server that runs the terminals, files and git there. The host must have FlightDeck (desktop) or the flightdeck-server installed and running, and this device’s public key added to its ~/.ssh/authorized_keys.',
			'automation.error.unavailable' => ({required Object harness}) => '${harness} is not installed or is not on PATH.',
			'automation.error.modelUnavailable' => ({required Object model, required Object harness}) => 'Model "${model}" is not available for ${harness}. Choose another model in Settings.',
			'automation.error.authentication' => ({required Object harness, required Object detail}) => '${harness}: ${detail}',
			'automation.error.timeout' => ({required Object harness, required Object seconds}) => '${harness} did not respond within ${seconds} seconds.',
			'automation.error.cancelled' => 'Commit message generation was cancelled.',
			'automation.error.process' => ({required Object harness, required Object detail}) => '${harness}: ${detail}',
			'automation.error.processNoDetail' => ({required Object harness}) => '${harness} could not generate a commit message.',
			'automation.error.invalidResponse' => 'The automation returned an empty commit message.',
			'automation.error.busy' => 'Another commit message is already being generated.',
			'automation.error.unknown' => 'The automation could not generate a commit message.',
			'automation.error.noWorkspace' => 'No workspace selected.',
			'automation.error.fileOutsideWorkspace' => 'File is outside the workspace roots.',
			'automation.error.fileUnreadable' => ({required Object detail}) => 'Could not read the file: ${detail}',
			'automation.error.binaryFile' => 'A commit message cannot be generated for a binary file.',
			_ => null,
		} ?? switch (path) {
			'automation.error.noFileChanges' => 'There are no changes to describe for this file.',
			'automation.error.noStagedChanges' => 'There are no staged changes to describe.',
			'automation.error.multipleRepositories' => 'Staged changes belong to multiple repositories. Generate them separately.',
			'automation.error.diffUnavailable' => 'Could not read the diff.',
			'automation.error.notConfigured' => 'Configure a commit message harness in Settings.',
			'fileOperation.error.alreadyExists' => ({required Object name}) => 'Already exists: “${name}”.',
			'fileOperation.error.notFound' => ({required Object name}) => 'Not found: “${name}”.',
			'fileOperation.error.invalidPath' => 'Invalid path.',
			'fileOperation.error.emptyName' => 'The name cannot be empty.',
			'fileOperation.error.noWorkspace' => 'No workspace selected.',
			'fileOperation.error.cannotMoveIntoItself' => 'Cannot move a folder into itself.',
			'fileOperation.error.clipboardEmpty' => 'Clipboard is empty.',
			'fileOperation.error.notScratchTab' => 'This tab is not a scratch file.',
			'fileOperation.error.writeFailed' => 'Could not write the file.',
			'fileOperation.error.formatterEmptyCommand' => 'Empty formatter command.',
			'fileOperation.error.formatterMissingPlaceholder' => 'Formatter command must include the %FILE% placeholder.',
			'fileOperation.error.formatterTimeout' => 'Formatter timed out.',
			'fileOperation.error.formatterExitCode' => ({required Object code}) => 'Formatter exited with ${code}.',
			'fileOperation.error.formatterFailed' => 'The formatter could not run.',
			'fileOperation.error.osFailure' => ({required Object detail}) => '${detail}',
			'fileOperation.error.nameHasSlash' => 'Name cannot contain “/”.',
			'fileOperation.error.invalidName' => 'Invalid name.',
			'theme.error.io' => 'Could not read or write the theme file.',
			'theme.error.ioDetail' => ({required Object detail}) => 'Could not read or write the theme file: ${detail}',
			'theme.error.malformedJson' => ({required Object detail}) => 'This file is not valid JSON: ${detail}',
			'theme.error.invalidTheme' => 'This file is not a valid theme.',
			'theme.error.reservedId' => 'This theme uses the id of a built-in theme. Change "id" in the file and import again.',
			'theme.error.notAnObject' => ({required Object field}) => 'Expected an object at "${field}".',
			'theme.error.missingField' => ({required Object field}) => 'Missing required field "${field}".',
			'theme.error.badColor' => ({required Object value, required Object field}) => '"${value}" at "${field}" is not a color. Use #RGB, #RRGGBB or #RRGGBBAA.',
			'theme.error.unknownBase' => ({required Object value}) => 'Unknown base theme "${value}" in "extends".',
			'theme.error.noVariants' => 'The theme declares no variant. Add "dark", "light" or both under "variants".',
			_ => null,
		};
	}
}
