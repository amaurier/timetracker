{$forms.profileForm.open}
  <div class="form-group">
    <label>{$i18n.label.person_name} (*)</label>
    {$forms.profileForm.name.control}
  </div>
  <div class="form-group">
    <label>{$i18n.label.login} (*)</label>
    {$forms.profileForm.login.control}
  </div>
  {if !$auth_external}
    <div class="form-group">
      <label>{$i18n.label.password} (*)</label>
      {$forms.profileForm.password1.control}
    </div>
    <div class="form-group">
      <label>{$i18n.label.confirm_password} (*)</label>
      {$forms.profileForm.password2.control}
    </div>
  {/if}
  <div class="form-group">
    <label>{$i18n.label.email} (*)</label>
    {$forms.profileForm.email.control}
  </div>
  <div>
    {$i18n.label.required_fields}
  </div>
  <div>
    {$forms.profileForm.btn_save.control}
  </div>
{$forms.profileForm.close}
