<script>
<!--
function get_date() {
  var date = new Date();
  return date.strftime("%Y-%m-%d");
}
//-->
</script>

<div class="row">
  {if isTrue($smarty.const.MULTITEAM_MODE) && $smarty.const.AUTH_MODULE == 'db'}
    <div class="col-md-6">
      <div class="col-md-8 offset-md-2">
        {$forms.loginForm.open}
        {include file="login.`$smarty.const.AUTH_MODULE`.tpl"}
        {$forms.loginForm.close}
      </div>
    </div>
    <div class="col-md-6">
      <div class="col-md-8 offset-md-2">
      <a class="btn btn-success btn-block" href="register.php">{$i18n.menu.create_group}</a>
      </div>
    </div>
  {else}
    <div class="col-md-4 offset-md-4">
      {$forms.loginForm.open}
      {include file="login.`$smarty.const.AUTH_MODULE`.tpl"}
      {$forms.loginForm.close}
    </div>
  {/if}

</div>
<div class="row">
  <div class="col-md-4 offset-md-4">
    {if !empty($about_text)}
      <em>{$about_text}</em>
    {/if}
  </div>
</div>
