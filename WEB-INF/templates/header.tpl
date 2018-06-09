<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset={$smarty.const.CHARSET}">
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
  <link href="{$smarty.const.DEFAULT_CSS}" rel="stylesheet" type="text/css">
{if $i18n.language.rtl}
  <link href="{$smarty.const.RTL_CSS}" rel="stylesheet" type="text/css">
{/if}
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <title>Time Tracker{if $title} - {$title}{/if}</title>
  <script src="js/strftime.js"></script>
  <script>
    {* Setup locale for strftime *}
    {$js_date_locale}
  </script>
  <script src="js/strptime.js"></script>
</head>

<body {$onload}>

  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    {if $user->custom_logo}
      <a class="navbar-brand" href="#"><img alt="Time Tracker" width="300" height="43" src="{$custom_logo}" border="0"></a>
    {else}
      <a class="navbar-brand" href="https://www.anuko.com/lp/tt_1.htm" target="_blank">
      <img alt="Anuko Time Tracker" width="auto" height="24" src="images/tt_logo.png" border="0">
      </a>
    {/if}
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

  {if $authenticated}
    {if $user->can('administer_site')}
      <!-- sub menu for admin -->
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="admin_groups.php">{$i18n.menu.groups}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin_options.php">{$i18n.menu.options}</a>
        </li>
      </ul>
      <!-- end of sub menu for admin -->
      <!-- top menu for admin -->
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            {if $user->name}
                {$user->name|escape}
            {/if}
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
            <span class="dropdown-item-text">
              {$user->role_name|escape}
            </span>
            {if $user->behalf_id > 0}
              <span class="dropdown-item-text">
                <b>{$i18n.label.on_behalf} {$user->behalf_name|escape}</b>
              </span>
            {/if}
            {if $user->group}
              <span class="dropdown-item-text">
                {$user->group|escape}
              </span>
            {/if}
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="logout.php">{$i18n.menu.logout}</a>
            <a class="dropdown-item" href="{$smarty.const.FORUM_LINK}" target="_blank">{$i18n.menu.forum}</a>
            <a class="dropdown-item" href="{$smarty.const.HELP_LINK}" target="_blank">{$i18n.menu.help}</a>
          </div>
        </li>
      </ul>
      <!-- end of top menu for admin -->
    {else}
      <!-- sub menu for authorized user -->
      <ul class="navbar-nav mr-auto">
        {if $user->can('track_own_time') || $user->can('track_time')}
          <li class="nav-item"><a class="nav-link" href="time.php">{$i18n.menu.time}</a></li>
        {/if}
        {if $user->isPluginEnabled('ex') && ($user->can('track_own_expenses') || $user->can('track_expenses'))}
          <li class="nav-item"><a class="nav-link" href="expenses.php">{$i18n.menu.expenses}</a></li>
        {/if}
        {if $user->can('view_own_reports') || $user->can('view_reports')}
          <li class="nav-item"><a class="nav-link" href="reports.php">{$i18n.menu.reports}</a></li>
        {/if}
        {if $user->isPluginEnabled('iv') && ($user->can('view_own_invoices') || $user->can('manage_invoices'))}
          <li class="nav-item"><a class="nav-link" href="invoices.php">{$i18n.title.invoices}</a></li>
        {/if}
        {if ($user->isPluginEnabled('ch') && ($user->can('view_own_charts') || $user->can('view_charts'))) && ($smarty.const.MODE_PROJECTS == $user->tracking_mode
          || $smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode || $user->isPluginEnabled('cl'))}
          <li class="nav-item"><a class="nav-link" href="charts.php">{$i18n.menu.charts}</a></li>
        {/if}
        {if ($user->can('view_own_projects') || $user->can('manage_projects')) && ($smarty.const.MODE_PROJECTS == $user->tracking_mode || $smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode)}
          <li class="nav-item"><a class="nav-link" href="projects.php">{$i18n.menu.projects}</a></li>
        {/if}
        {if ($smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode && ($user->can('view_own_tasks') || $user->can('manage_tasks')))}
          <li class="nav-item"><a class="nav-link" href="tasks.php">{$i18n.menu.tasks}</a></li>
        {/if}
        {if $user->can('view_users') || $user->can('manage_users')}
          <li class="nav-item"><a class="nav-link" href="users.php">{$i18n.menu.users}</a></li>
        {/if}
        {if $user->isPluginEnabled('cl') && ($user->can('view_own_clients') || $user->can('manage_clients'))}
          <li class="nav-item"><a class="nav-link" href="clients.php">{$i18n.menu.clients}</a></li>
        {/if}
        {if $user->can('export_data')}
          <li class="nav-item"><a class="nav-link" href="export.php">{$i18n.menu.export}</a></li>
        {/if}
      </ul>
      <!-- end of sub menu for authorized user -->
      <!-- top menu for authorized user -->
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            {if $user->name}
                {$user->name|escape}
            {/if}
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
            <span class="dropdown-item-text">
              {$user->role_name|escape}
            </span>
            {if $user->behalf_id > 0}
              <span class="dropdown-item-text">
                <b>{$i18n.label.on_behalf} {$user->behalf_name|escape}</b>
              </span>
            {/if}
            {if $user->group}
              <span class="dropdown-item-text">
                {$user->group|escape}
              </span>
            {/if}
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="logout.php">{$i18n.menu.logout}</a>
            {if $user->can('manage_own_settings')}
                <a class="dropdown-item" href="profile_edit.php">{$i18n.menu.profile}</a>
            {/if}
            {if $user->can('manage_basic_settings')}
                <a class="dropdown-item" href="group_edit.php">{$i18n.menu.group}</a>
            {/if}
            <a class="dropdown-item" href="{$smarty.const.FORUM_LINK}" target="_blank">{$i18n.menu.forum}</a>
            <a class="dropdown-item" href="{$smarty.const.HELP_LINK}" target="_blank">{$i18n.menu.help}</a>
          </div>
        </li>
      </ul>
      <!-- end of top menu for authorized user -->
    {/if}
  {else}
  <!-- top menu for non authorized user -->
  <ul class="navbar-nav mr-auto">
    <li class="nav-item">
      <a class="nav-link" href="login.php">{$i18n.menu.login}</a>
    </li>
    {if isTrue($smarty.const.MULTITEAM_MODE) && $smarty.const.AUTH_MODULE == 'db'}
      <li class="nav-item">
        <a class="nav-link" href="register.php">{$i18n.menu.create_group}</a>
      </li>
    {/if}
  </ul>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="{$smarty.const.FORUM_LINK}" target="_blank">{$i18n.menu.forum}</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="{$smarty.const.HELP_LINK}" target="_blank">{$i18n.menu.help}</a>
    </li>
  </ul>
{/if}
  </div>
</nav>

<header class="container">
  <div class="row">
    <div class="col-sm-12">
      <!-- page title and user details -->
{if $title}
      <div class="pb-2 mt-4 mb-4 border-bottom">
        <h1>{$title}{if $timestring}: {$timestring}{/if}</h1>
      </div>

{/if}
    </div>
  </div>
      <!-- end of page title and user details -->

      <!-- output errors -->
{if $err->yes()}
  {foreach $err->getErrors() as $error}
            <div class="alert alert-danger">{$error.message}</div> {* No need to escape as they are not coming from user and may contain a link. *}
  {/foreach}
{/if}
      <!-- end of output errors -->

      <!-- output messages -->
{if $msg->yes()}
  {foreach $msg->getErrors() as $message}
            <div class="alert alert-info">{$message.message}</div> {* No need to escape. *}
  {/foreach}
{/if}
      <!-- end of output messages -->
</header>
