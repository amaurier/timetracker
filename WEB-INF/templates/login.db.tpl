<form>
  <div class="form-group">
    <label>{$i18n.label.login}</label>
    {$forms.loginForm.login.control}
  </div>
  <div class="form-group">
    <label>{$i18n.label.password}</label>
    {$forms.loginForm.password.control}
    <a href ="password_reset.php">{$i18n.form.login.forgot_password}</a>
  </div>
  <div>
    {$forms.loginForm.btn_login.control}
  </div>
</form>
