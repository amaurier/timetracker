<script>
<!--
function get_date() {
  var date = new Date();
  return date.strftime("%Y-%m-%d");
}
//-->
</script>

<div class="row">
  <div class="col-md-4 offset-md-4">
    {$forms.loginForm.open}
    {include file="login.`$smarty.const.AUTH_MODULE`.tpl"}
    {$forms.loginForm.close}
    {if !empty($about_text)}
      <em>{$about_text}</em>
    {/if}
  </div>
</div>
