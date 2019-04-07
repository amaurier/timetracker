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
        {if $title}
          {include file="title.tpl"}
        {/if}
    {else}
      <div class="col-sm-12">
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

</body>
</html>
