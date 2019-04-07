{include file="header.tpl"}

<body {$onload}>
{include file="navbar.tpl"}

<div class="container-fluid">
  <div class="row">
    {if $authenticated}
      <div class="col-sm-2">
        {include file="sidebar.tpl"}
      </div>
      <div class="col-sm-10">
    {else}
      <div class="col-sm-12">
    {/if}

      {if $title}
        {include file="title.tpl"}
      {/if}
      {if $err->yes()}
        {include file="errors.tpl"}
      {/if}
      {if $msg->yes()}
        {include file="messages.tpl"}
      {/if}
      {if $content_page_name}
        {include file="$content_page_name"}
      {/if}
    </div>
  </div>
</div>

{include file="footer.tpl"}
</body>
</html>
