<script>
  function chLocation(newLocation) { document.location = newLocation; }
</script>

{$forms.timesheetsForm.open}
<table cellspacing="0" cellpadding="7" border="0" width="720">
{if $user_dropdown}
  <tr><td align="center">{$i18n.label.user}: {$forms.timesheetsForm.user.control}</td></tr>
{/if}
  <tr>
    <td valign="top">
      <table cellspacing="1" cellpadding="3" border="0" width="100%">
{if $inactive_timesheets}
        <tr><td class="sectionHeaderNoBorder">{$i18n.form.timesheets.active_timesheets}</td></tr>
{/if}
        <tr>
          <td class="tableHeader">{$i18n.label.thing_name}</td>
{if $show_client}
          <td class="tableHeader">{$i18n.label.client}</td>
{/if}
          <td class="tableHeader">{$i18n.label.submitted}</td>
          <td class="tableHeader">{$i18n.label.approved}</td>
          <td class="tableHeader">{$i18n.label.view}</td>
          <td class="tableHeader">{$i18n.label.edit}</td>
        </tr>
{foreach $active_timesheets as $timesheet}
        <tr valign="top" bgcolor="{cycle values="#f5f5f5,#ffffff"}">
          <td>{$timesheet.name|escape}</td>
  {if $show_client}
          <td>{$timesheet.client_name|escape}</td>
  {/if}
          <td>{if $timesheet.submit_status}{$i18n.label.yes}{else}{$i18n.label.no}{/if}</td>
  {if $timesheet.approve_status == null}
          <td></td>
  {else}
          <td>{if $timesheet.approve_status}{$i18n.label.yes}{else}{$i18n.label.no}{/if}</td>
  {/if}
          <td><a href="timesheet_view.php?id={$timesheet.id}">{$i18n.label.view}</a></td>
          <td><a href="timesheet_edit.php?id={$timesheet.id}">{$i18n.label.edit}</a></td>
        </tr>
{/foreach}
      </table>

      <table width="100%">
        <tr><td align="center"><br><form><input type="button" onclick="chLocation('timesheet_add.php');" value="{$i18n.button.add}"></form></td></tr>
      </table>

{if $inactive_timesheets}
      <table cellspacing="1" cellpadding="3" border="0" width="100%">

        <tr><td class="sectionHeaderNoBorder">{$i18n.form.timesheets.inactive_timesheets}</td></tr>
        <tr>
          <td class="tableHeader">{$i18n.label.thing_name}</td>
  {if $show_client}
          <td class="tableHeader">{$i18n.label.client}</td>
  {/if}
          <td class="tableHeader">{$i18n.label.submitted}</td>
          <td class="tableHeader">{$i18n.label.approved}</td>
          <td class="tableHeader">{$i18n.label.view}</td>
          <td class="tableHeader">{$i18n.label.edit}</td>
        </tr>
  {foreach $inactive_timesheets as $timesheet}
        <tr valign="top" bgcolor="{cycle values="#f5f5f5,#ffffff"}">
          <td>{$timesheet.name|escape}</td>
    {if $show_client}
          <td>{$timesheet.client_name|escape}</td>
    {/if}
          <td>{if $timesheet.submit_status}{$i18n.label.yes}{else}{$i18n.label.no}{/if}</td>
    {if $timesheet.approve_status == null}
          <td></td>
    {else}
          <td>{if $timesheet.approve_status}{$i18n.label.yes}{else}{$i18n.label.no}{/if}</td>
    {/if}
          <td><a href="timesheet_view.php?id={$timesheet.id}">{$i18n.label.view}</a></td>
          <td><a href="timesheet_edit.php?id={$timesheet.id}">{$i18n.label.edit}</a></td>
        </tr>
  {/foreach}
      </table>

      <table width="100%">
        <tr><td align="center"><br><form><input type="button" onclick="chLocation('reports.php');" value="{$i18n.button.add}"></form></td></tr>
      </table>
{/if}
    </td>
  </tr>
</table>
{$forms.timesheetsForm.close}
