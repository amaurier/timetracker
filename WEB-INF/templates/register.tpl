<div class="row">
  {if !empty($about_text)}
    <div class="col-md-8">
      {$about_text}
      <a href="https://www.anuko.com/lp/tt_8.htm" target="_blank">{$i18n.footer.contribute_msg}</a>
    </div>
    <div class="col-md-4">
  {else}
    <div class="col-md-12">
  {/if}

    {$forms.groupForm.open}
      <div class="form-group">
        <label>{$i18n.label.group_name}</label>
        {$forms.groupForm.group_name.control}
      </div>
      <div class="form-group">
        <label>{$i18n.label.currency}</label>
        {$forms.groupForm.currency.control}
      </div>
      <div class="form-group">
        <label>{$i18n.label.language}</label>
        {$forms.groupForm.lang.control}
      </div>
      <div class="form-group">
        <label>{$i18n.label.manager_name} (*)</label>
        {$forms.groupForm.manager_name.control}
      </div>
      <div class="form-group">
        <label>{$i18n.label.manager_login} (*)</label>
        {$forms.groupForm.manager_login.control}
      </div>
      <div class="form-group">
        <label>{$i18n.label.password} (*)</label>
        {$forms.groupForm.password1.control}
      </div>
      <div class="form-group">
        <label>{$i18n.label.confirm_password} (*)</label>
        {$forms.groupForm.password2.control}
      </div>
      <div class="form-group">
        <label>{$i18n.label.email}</label>
        {$forms.groupForm.manager_email.control}
      </div>
      <div>
        {$i18n.label.required_fields}
      </div>
      <div>
        {$forms.groupForm.btn_submit.control}
      </div>
    {$forms.groupForm.close}

    {if isTrue($smarty.const.MULTITEAM_MODE) && $smarty.const.AUTH_MODULE == 'db'}
        Ou <a class="" href="login.php">{$i18n.menu.login}</a>
    {/if}
  </div>
</div>
