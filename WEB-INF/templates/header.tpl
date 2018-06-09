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

{assign var="tab_width" value="700"}
<div class="container">

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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

{if $authenticated}
  {if $user->can('administer_site')}
      <!-- top menu for admin -->
      <table cellspacing="0" cellpadding="3" width="100%" border="0">
        <tr>
          <td class="systemMenu" height="17" align="center">&nbsp;
            <a class="systemMenu" href="logout.php">{$i18n.menu.logout}</a> &middot;
            <a class="systemMenu" href="{$smarty.const.FORUM_LINK}" target="_blank">{$i18n.menu.forum}</a> &middot;
            <a class="systemMenu" href="{$smarty.const.HELP_LINK}" target="_blank">{$i18n.menu.help}</a>
          </td>
        </tr>
      </table>
      <!-- end of top menu for admin -->

      <!-- sub menu for admin -->
      <table cellspacing="0" cellpadding="3" width="100%" border="0">
        <tr>
          <td align="center" bgcolor="#d9d9d9" nowrap height="17" background="images/subm_bg.gif">&nbsp;
            <a class="mainMenu" href="admin_groups.php">{$i18n.menu.groups}</a> &middot;
            <a class="mainMenu" href="admin_options.php">{$i18n.menu.options}</a>
          </td>
        </tr>
      </table>
      <!-- end of sub menu for admin -->
  {else}
      <!-- top menu for authorized user -->
      <table cellspacing="0" cellpadding="3" width="100%" border="0">
        <tr>
          <td class="systemMenu" height="17" align="center">&nbsp;
            <a class="systemMenu" href="logout.php">{$i18n.menu.logout}</a> &middot;
    {if $user->can('manage_own_settings')}
            <a class="systemMenu" href="profile_edit.php">{$i18n.menu.profile}</a> &middot;
    {/if}
    {if $user->can('manage_basic_settings')}
            <a class="systemMenu" href="group_edit.php">{$i18n.menu.group}</a> &middot;
    {/if}
            <a class="systemMenu" href="{$smarty.const.FORUM_LINK}" target="_blank">{$i18n.menu.forum}</a> &middot;
            <a class="systemMenu" href="{$smarty.const.HELP_LINK}" target="_blank">{$i18n.menu.help}</a>
          </td>
        </tr>
      </table>
      <!-- end of top menu for authorized user -->

      <!-- sub menu for authorized user -->
      <table cellspacing="0" cellpadding="3" width="100%" border="0">
        <tr>
          <td align="center" bgcolor="#d9d9d9" nowrap height="17" background="images/subm_bg.gif">&nbsp;
    {if $user->can('track_own_time') || $user->can('track_time')}
           <a class="mainMenu" href="time.php">{$i18n.menu.time}</a>
    {/if}
    {if $user->isPluginEnabled('ex') && ($user->can('track_own_expenses') || $user->can('track_expenses'))}
            &middot; <a class="mainMenu" href="expenses.php">{$i18n.menu.expenses}</a>
    {/if}
    {if $user->can('view_own_reports') || $user->can('view_reports')}
            &middot; <a class="mainMenu" href="reports.php">{$i18n.menu.reports}</a>
    {/if}
    {if $user->isPluginEnabled('iv') && ($user->can('view_own_invoices') || $user->can('manage_invoices'))}
            &middot; <a class="mainMenu" href="invoices.php">{$i18n.title.invoices}</a>
    {/if}
    {if ($user->isPluginEnabled('ch') && ($user->can('view_own_charts') || $user->can('view_charts'))) && ($smarty.const.MODE_PROJECTS == $user->tracking_mode
      || $smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode || $user->isPluginEnabled('cl'))}
            &middot; <a class="mainMenu" href="charts.php">{$i18n.menu.charts}</a>
    {/if}
    {if ($user->can('view_own_projects') || $user->can('manage_projects')) && ($smarty.const.MODE_PROJECTS == $user->tracking_mode || $smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode)}
            &middot; <a class="mainMenu" href="projects.php">{$i18n.menu.projects}</a>
    {/if}
    {if ($smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode && ($user->can('view_own_tasks') || $user->can('manage_tasks')))}
            &middot; <a class="mainMenu" href="tasks.php">{$i18n.menu.tasks}</a>
    {/if}
    {if $user->can('view_users') || $user->can('manage_users')}
            &middot; <a class="mainMenu" href="users.php">{$i18n.menu.users}</a>
    {/if}
    {if $user->isPluginEnabled('cl') && ($user->can('view_own_clients') || $user->can('manage_clients'))}
            &middot; <a class="mainMenu" href="clients.php">{$i18n.menu.clients}</a>
    {/if}
    {if $user->can('export_data')}
            &middot; <a class="mainMenu" href="export.php">{$i18n.menu.export}</a>
    {/if}
          </td>
        </tr>
      </table>
      <!-- end of sub menu for authorized user -->
  {/if}
{else}
  <!-- top menu for non authorized user -->
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="login.php">{$i18n.menu.login}</a>
      </li>
      {if isTrue($smarty.const.MULTITEAM_MODE) && $smarty.const.AUTH_MODULE == 'db'}
        <li class="nav-item">
          <a class="nav-link" href="register.php">{$i18n.menu.create_group}</a>
        </li>
      {/if}
      <li class="nav-item">
        <a class="nav-link" href="{$smarty.const.FORUM_LINK}" target="_blank">{$i18n.menu.forum}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="{$smarty.const.HELP_LINK}" target="_blank">{$i18n.menu.help}</a>
      </li>
    </ul>
  </div>

</nav>


{/if}

      <!-- page title and user details -->
{if $title}
      <h1>{$title}{if $timestring}: {$timestring}{/if}</h1>
  {if $user->name}
        <h2>{$user->name|escape} - {$user->role_name|escape}{if $user->behalf_id > 0} <b>{$i18n.label.on_behalf} {$user->behalf_name|escape}</b>{/if}{if $user->group}, {$user->group|escape}{/if}</h2>
  {/if}
{/if}
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
