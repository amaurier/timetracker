<script>
<!--
function get_date() {
  var date = new Date();
  return date.strftime("%Y-%m-%d");
}
//-->
</script>

<div class="row">

    {if !empty($about_text)}
      <div class="col-md-8">
        <p class="mx-3 my-3 h1">
          {$about_text}
        </p>
        <p class="mx-3 my-3 h3">
          <a href="https://www.anuko.com/lp/tt_8.htm" target="_blank">{$i18n.footer.contribute_msg}</a>
        </p>
      </div>
      <div class="col-md-4">
    {else}
      <div class="col-md-4 offset-md-4">
    {/if}

    <div class="mx-3 my-3">
      {$forms.loginForm.open}
      {include file="login.`$smarty.const.AUTH_MODULE`.tpl"}
      {$forms.loginForm.close}

      {if isTrue($smarty.const.MULTITEAM_MODE) && $smarty.const.AUTH_MODULE == 'db'}
          Ou <a class="" href="register.php">{$i18n.menu.create_group}</a>
      {/if}
    </div>
  </div>
</div>
