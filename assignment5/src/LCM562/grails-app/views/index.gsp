<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main1"/>
    <title>Welcome to Lambert Condition Monitoring Ltd.</title>
  </head>
  <body class="pull_top">
    <section id="feature_slider" class="lol">
      <!-- 
          Each slide is composed by <img> and .info
          - .info's position is customized with css in index.css
          - each <img> parallax effect is declared by the following params inside its class:
          
          example: class="asset left-472 sp600 t120 z3"
          left-472 means left: -472px from the center
          sp600 is speed transition
          t120 is top to 120px
          z3 is z-index to 3
          Note: Maintain this order of params

          For the backgrounds, you can combine from the bgs folder :D
      -->
      <article class="slide" id="presencia" style="background: url('images/color-splash.jpg') repeat-x top center;">
        <img class="asset left-30 sp600 t120 z1" src="${resource(dir: 'images', file: 'LCM_IronBow5_size2.png')}" />
        <div class="info">
          <h2>You don't have a good monitoring system for your equipment yet?</h2>
          <h2>What are you waiting for?</h2><a href="mailto:ssanguin@hawk.iit.edu">CONTACT NOW!</a>
        </div>
      </article>
      <article class="slide" id="tecnologias2" style="background: url('images/indigo.jpg') repeat-x top center;">
        <img class="asset left-400 sp800 t210 z2" src="${resource(dir: 'images', file: 'technique.png')}" />
        <img class="asset left30 sp700 t210 z2" src="${resource(dir: 'images', file: 'technique2.png')}" />
        <div class="info">
          <h2>
            The most advanced monitoring techniques for your electrical equipment
          </h2>                
        </div>
      </article>
      <article class="slide" id="ideas" style="background: url('images/aqua.jpg') repeat-x top center;">
        <div class="info">
          <h2>Custom reports, user accounts, e-mail alerts and much more!</h2>
        </div>
        <img class="asset left-460 sp400 t210 z1" src="${resource(dir: 'images', file: 'report.png')}" />
        <img class="asset left-130 sp600 t210 z2" src="${resource(dir: 'images', file: 'account.jpg')}" />
        <img class="asset left150 sp800 t210 z1" src="${resource(dir: 'images', file: 'email.png')}" />
      </article>

    </section>
    <div id="showcase">
      <div class="container">
        <div class="section_header">
          <h3>Information</h3>
        </div>            
        <div class="row feature_wrapper">
          <!-- Features Row -->
          <div class="features_op1_row">
            <!-- Feature -->
            <div class="col-sm-4 feature first">
              <div class="img_box">
                  <img src="images/overview1.png">
              </div>
              <div class="text">
                <h6>Company Overview</h6>
                <p>
                  Lambert Condition Monitoring Ltd.’s experience spans over 21 years in the industrial sector of the East Coast of both islands, covering horticultural, agricultural and manufacturing industries such as timber processing companies, cool storage companies, apple packing facilities and meat processing factories. We have found that the technology is invaluable for maintaining production and protecting client’s safety and assets. These programs can greatly minimize repair and labour costs, reduce inventory of parts, and avoid product variation and production loss.
                </p>
              </div>
            </div>
            <!-- Feature -->
            <div class="col-sm-4 feature">
              <div class="img_box">
                  <img src="images/productivity.jpg">
              </div>
              <div class="text">
                <h6>Mission Statement</h6>
                <p>
                  Lambert Condition Monitoring Ltd.’s goal is to offer the latest world technologies in predictive maintenance to aid industry to reduce production losses and assist in their productivity, quality, safety and profitability.
                </p>
              </div>
            </div>
            <!-- Feature -->
            <div class="col-sm-4 feature last">
              <div class="img_box">
                  <img src="images/Thermography.png">
              </div>
              <div class="text">
                <h6>Thermography</h6>
                <p>
                  Thermal imaging has emerged as an effective predictive maintenance technology by identifying variations that can lead to equipment failure.
                </p>
                <p>By using a different spectrum of light, problems that are invisible to the naked eye become clear with an image of a thermal nature. With regular inspection, issues can be highlighted before damage occurs, saving production losses and damage to plant and equipment, leaving the machinery operating in a safe condition.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
