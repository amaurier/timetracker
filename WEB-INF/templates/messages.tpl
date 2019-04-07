{foreach $msg->getErrors() as $message}
          <div class="alert alert-info">{$message.message}</div> {* No need to escape. *}
{/foreach}
