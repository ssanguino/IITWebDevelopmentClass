<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Uploader</title>
  </head>
  <body>
    <div class="nav" role="navigation">
      <ul>
        <li><a class="home" href="/LCM562/">Home</a></li>
      </ul>
    </div>
    <div id="create-location" class="content scaffold-create" role="main">
      <h1>New Upload</h1>

      <form action="/LCM562/upload/save" method="post" enctype="multipart/form-data" >
        <fieldset class="form">
          
          <div class="fieldcontain">
            <label for="file">
              File
            </label>
            <input type="file" name="file" value="" id="file" accept=".pdf" />
          </div>

          <div class="fieldcontain required">
            <label for="primaryLocation">
              Primary Location
              <span class="required-indicator">*</span>
            </label>
            <g:select id="primaryLocation" name="primaryLocation.id" from="${lcm562.Location.list()}" optionKey="id" required="" value="${primaryLocation?.id}" class="many-to-one"/>
          </div>

        </fieldset>
        <fieldset class="buttons">
          <input type="submit" name="create" class="save" value="Create" id="create" />
        </fieldset>
      </form>
    </div>
  </body>
</html>
