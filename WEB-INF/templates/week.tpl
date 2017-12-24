{include file="time_script.tpl"}

<style>
.not_billable td {
  color: #ff6666;
}
</style>

{$forms.timeRecordForm.open}
<table cellspacing="4" cellpadding="0" border="0">
{if defined(WEEK_VIEW_DEBUG)}
  <tr>
    <td align="center" colspan=2">
      <a href="time.php?date={$selected_date->toString()}">{$i18n.label.day_view}</a>&nbsp;/&nbsp;<a href="week.php?date={$selected_date->toString()}">{$i18n.label.week_view}</a>
    </td>
  </tr>
{/if}
  <tr>
    <td valign="top">
      <table>
{if $on_behalf_control}
        <tr>
          <td align="right">{$i18n.label.user}:</td>
          <td>{$forms.timeRecordForm.onBehalfUser.control}</td>
        </tr>
{/if}
      </table>
    </td>
    <td valign="top">
      <table>
        <tr><td>{$forms.timeRecordForm.date.control}</td></tr>
      </table>
    </td>
  </tr>
</table>

<table width="720">
<tr>
  <td valign="top">
{if $grouped_records}
      <table border="0" cellpadding="3" cellspacing="1" width="100%">
      <tr>
  {if ($user->isPluginEnabled('cl') || ($smarty.const.MODE_PROJECTS == $user->tracking_mode || $smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode))}
        <td class="tableHeader"></td>
  {/if}
  {if ($user->isPluginEnabled('cf') || $smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode)}
        <td class="tableHeader"></td>
  {/if}
        <td class="tableHeader">{$day_header_0}</td>
        <td class="tableHeader">{$day_header_1}</td>
        <td class="tableHeader">{$day_header_2}</td>
        <td class="tableHeader">{$day_header_3}</td>
        <td class="tableHeader">{$day_header_4}</td>
        <td class="tableHeader">{$day_header_5}</td>
        <td class="tableHeader">{$day_header_6}</td>
      </tr>
  {foreach $grouped_records as $record}
      <tr bgcolor="{cycle values="#f5f5f5,#ffffff"}" {if !$record.billable} class="not_billable" {/if}>
    {if ($user->isPluginEnabled('cl') || ($smarty.const.MODE_PROJECTS == $user->tracking_mode || $smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode))}
        <td valign="top">{$record.project|escape}<p>{$record.client|escape}</td>
    {/if}
    {if ($user->isPluginEnabled('cf') || $smarty.const.MODE_PROJECTS_AND_TASKS == $user->tracking_mode)}
        <td valign="top">{$record.task|escape}<p>{$record.cf_1_value|escape}</td>
    {/if}
        <td valign="top">{$record.$day_header_0.duration}</td>
        <td valign="top">{$record.$day_header_1.duration}</td>
        <td valign="top">{$record.$day_header_2.duration}</td>
        <td valign="top">{$record.$day_header_3.duration}</td>
        <td valign="top">{$record.$day_header_4.duration}</td>
        <td valign="top">{$record.$day_header_5.duration}</td>
        <td valign="top">{$record.$day_header_6.duration}</td>
      </tr>
  {/foreach}
    </table>
{/if}
  </td>
</tr>
</table>
<!--
{if $time_records}
<table cellpadding="3" cellspacing="1" width="720">
  <tr>
    <td align="left">{$i18n.label.week_total}: {$week_total}</td>
    <td align="right">{$i18n.label.day_total}: {$day_total}</td>
  </tr>
  {if $user->isPluginEnabled('mq')}
  <tr>
    <td align="left">{$i18n.label.month_total}: {$month_total}</td>
    {if $over_quota}
    <td align="right">{$i18n.form.time.over_quota}: <span style="color: green;">{$quota_remaining}</span></td>
    {else}
    <td align="right">{$i18n.form.time.remaining_quota}: <span style="color: red;">{$quota_remaining}</span></td>
    {/if}
  </tr>
  {/if}
</table>
{/if}
-->
<table>
  <tr>
    <td align="center" colspan="2">{$forms.timeRecordForm.btn_submit.control}</td>
  </tr>
</table>
{$forms.timeRecordForm.close}