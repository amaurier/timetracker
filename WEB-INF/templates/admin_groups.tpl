<script>
  function chLocation(newLocation) { document.location = newLocation; }
</script>

<div class="alert alert-info">{$i18n.form.groups.hint}</div>

<table class="table table-striped table-borderless table-hover table-responsive-sm">
  <thead class="thead-dark">
    <tr>
      <th>{$i18n.label.id}</th>
      <th>{$i18n.label.thing_name}</th>
      <th>{$i18n.label.date}</th>
      <th>{$i18n.label.language}</th>
      <th>{$i18n.label.edit}</th>
      <th>{$i18n.label.delete}</th>
    </tr>
  </thead>
  {if $groups}
    <tbody>
      {foreach $groups as $group}
      <tr>
        <td>{$group.id}</td>
        <td>{$group.name|escape}</td>
        <td>{$group.date}</td>
        <td>{$group.lang}</td>
        <td><a href="admin_group_edit.php?id={$group.id}">{$i18n.label.edit}</a></td>
        <td><a href="admin_group_delete.php?id={$group.id}">{$i18n.label.delete}</a></td>
      </tr>
      {/foreach}
    </tbody>
  {/if}
</table>

<table width="100%">
  <tr>
    <td align="center">
      <br>
      <form>
        <input type="button" onclick="chLocation('admin_group_add.php');" value="{$i18n.button.create_group}">&nbsp;{$i18n.label.or}&nbsp;
        <input type="button" onclick="chLocation('import.php');" value="{$i18n.button.import}">
      </form>
    </td>
  </tr>
</table>
