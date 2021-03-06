<?php
$g_hostname               = '';
$g_db_type                = 'mysqli';
$g_database_name          = '';
$g_db_username            = '';
$g_db_password            = '';

$g_default_timezone       = 'UTC';

$g_crypto_master_salt     = 'j9hwyjq2DgjoTw0s2XOTJ34uR92DVvSkCg8nQEoI3ns=';

$g_window_title			= 'Paper Asset Tracking Tool';
$g_logo_image			= 'images/digitization_logo.png';
$g_favicon_image		= 'images/favicon.ico';

$g_roadmap_view_threshold = NOBODY;
$g_view_changelog_threshold = NOBODY;
$g_enable_project_documentation = OFF;
$g_manage_news_threshold = NOBODY;
$g_enable_profiles = OFF;

$g_status_enum_string = '10:new,20:feedback,30:acknowledged,40:confirmed,50:assigned,80:resolved,90:closed';

$g_bug_report_page_fields = array(
	'additional_info',
	'attachments',
	'category_id',
	'handler',
	'priority',
	'tags',
	'view_state',
);

$g_bug_view_page_fields = array(
	'additional_info',
	'attachments',
	'category_id',
	'date_submitted',
	'description',
	'handler',
	'id',
	'last_updated',
	'priority',
	'reporter',
	'status',
	'summary',
	'tags',
	'view_state',
);

$g_bug_update_page_fields = array(
	'additional_info',
	'attachments',
	'category_id',
	'date_submitted',
	'description',
	'handler',
	'id',
	'last_updated',
	'priority',
	'reporter',
	'status',
	'summary',
	'tags',
	'view_state',
);

$g_bug_change_status_page_fields = array(
	'additional_info',
	'attachments',
	'category_id',
	'date_submitted',
	'description',
	'handler',
	'id',
	'last_updated',
	'priority',
	'reporter',
	'status',
	'summary',
	'tags',
	'view_state',
);

$g_font_family = 'Segoe UI';
