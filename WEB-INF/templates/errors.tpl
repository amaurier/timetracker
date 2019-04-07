{foreach $err->getErrors() as $error}
          <div class="alert alert-danger">{$error.message}</div> {* No need to escape as they are not coming from user and may contain a link. *}
{/foreach}
