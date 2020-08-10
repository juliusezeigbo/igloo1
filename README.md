<h2>Table of Content</h2>

<a href="#">About the Project</a><br>
<a href="#">Built With</a><br>
<a href="#">Installation</a><br>
<a href="#">Usage</a><br>
<a href="#">Deploying to heroku</a><br>
<a href="#">The Team</a>


  <h2>About the Project</h2>
  <p>The Price Comparison tool will search the internet and retrieve pricing 
    information for any products it finds a match for. The tool will then return 
    and present the differences and allow users to easily identify any products 
    that don’t align with prevalent market pricing</p>


  <h2>Built With</h2>
    <ul>
      <li>Ruby</li>
      <li>HTML</li>
      <li>CSS</li>
      <li>Javascript</li>
      <li>Coffeescript</li>
    </ul>

  <h2>Installation</h2>
  <ul>
      <li>Clone</li>
          <p>https://github.com/UoA-CS5942/team_foxtrot_2020.git</p> 
      <li>Setting up the Dev Environment (AWS cloud9)</li>
  </ul>
  
<strong>Step 1: Create an AWS Account</strong>
If you already have an AWS account, skip ahead to Step 2: Sign in to the AWS Cloud9 Console with the AWS Account Root User.
<br>

1. To create an AWS account <br>
2. Go to https://aws.amazon.com. <br>
3. Choose Sign In to the Console. <br>
4. Choose Create a new AWS account. <br>

<br>
Complete the process by following the on-screen directions. This includes giving AWS your email address and credit card information. You must also use your phone to enter a code that AWS gives you.
After you finish creating the account, AWS will send you a confirmation email. Do not go to the next step until you get this confirmation.

<strong>Step 2: Sign In to the AWS Cloud9 Console with the AWS Account Root User</strong>

After you complete the previous step, you're ready to sign in to the AWS Cloud9 console with an AWS account root user and start using AWS Cloud9.
<br>

1. Open the AWS Cloud9 console, at https://console.aws.amazon.com/cloud9/. 
2. Enter the email address for your AWS account, and then choose Next.
3. Enter the password for your AWS account, and then choose Sign In.


The AWS Cloud9 console is displayed, and you can now start using AWS Cloud9.

  
  
  <h2>Usage</h2>
      <ul>
        <li>To use the application, run the following commands on the command-line terminal on your local machine (linux)</li>
          
            ----> bundle install
            ----> rails db:migrate
            ----> rails s
     
      
  
  <h2>Deploying to heroku</h2>
      The running application can be viewed on https://gph-project.herokuapp.com/
      In the Gemfile, add pg gem for Heroku and put sqlite3 under development
      In the command line, using the steps below, run the following commands
        <ol="1">
            <li>heroku create gph-project</li>
            <li>heroku git:remote -a "gph-project"</li>
            <li>git status</li>
            <li>git add .</li>
            <li>git commit -m "committing to heroku"</li>
            <li>git push</li>
            <li>git push heroku master</li>
            <li>heroku run rake db:migrate</li>
            <li>heroku rake db:seed</li>
            <li>heroku rake compare:seed_compare</li>
            <li>heroku open</li>
        </ol>
  
   
  <h2>The Team</h2>
  <ul>
    <li>Changsheng Lyu</li>
    <li>Ezeigbo Julius Leonard Chukwuemeka</li>
    <li>Mei Yuchen</li>
    <li>Ugochukwu-Ibe Ijeoma Mary</li>
    <li>Yuting Lei</li>
    <li>Yuhan Yin</li>
<ul>
