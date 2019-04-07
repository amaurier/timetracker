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
  {if $user->can('administer_site')}
    <!-- sub menu for admin -->
    <!-- end of sub menu for admin -->
    <!-- top menu for admin -->
    <!-- end of top menu for admin -->
  {else}
    <!-- sub menu for authorized user -->
    <!-- end of sub menu for authorized user -->
    <!-- top menu for authorized user -->
          {if $user->can('manage_own_settings')}
              <a class="dropdown-item" href="profile_edit.php">{$i18n.menu.profile}</a>
          {/if}
          {if $user->can('manage_basic_settings')}
              <a class="dropdown-item" href="group_edit.php">{$i18n.menu.group}</a>
          {/if}
    <!-- end of top menu for authorized user -->
  {/if}
  <a class="dropdown-item" href="{$smarty.const.FORUM_LINK}" target="_blank">{$i18n.menu.forum}</a>
  <a class="dropdown-item" href="{$smarty.const.HELP_LINK}" target="_blank">{$i18n.menu.help}</a>
</div>
</li>
</ul>
{else}
<!-- top menu for non authorized user -->
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
