{if $authenticated}
  {if $user->can('administer_site')}
    <!-- sub menu for admin -->
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link" href="admin_groups.php">{$i18n.menu.groups}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="admin_options.php">{$i18n.menu.options}</a>
      </li>
    </ul>
    <!-- end of sub menu for admin -->
    <!-- top menu for admin -->
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
