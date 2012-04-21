# aws-tools
An up-to-date bundle of all the Amazon Web Services (AWS) command line tools in a single location.

## why?
We've been maintaining a slightly different version of this project internally at Bizo for a couple of years and it has been helpful for us.  We figured it might be useful for others.  

Currently, one has to install all of these tools by downloading different zip files from [Amazon](http://aws.amazon.com/developertools/).  It is hard to keep track of what tools have been updated and kind of a PITA to find all of the tools.  We think it is easier to maintain a single project with all the tools in one place.  

Note: Our goal is not to be the repository for fixing bugs found in the already packaged tools at this point.

## installation

 * Clone project    
        
    ```git clone git://github.com/floodfx/aws-tools.git```
    
 * Update your shell init file
   * Ensure `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are available to your environment
   * Source `aws-tools-env.sh` from the aws-tools project
        
    
    ```
    ...
    # other shell init stuff
    
    # export AWS environment variables
    export AWS_ACCESS_KEY_ID="YOUR ACCESS KEY ID"
    export AWS_SECRET_ACCESS_KEY="YOUR SECRET ACCESS KEY"
    # required for ec2-* tools
    export EC2_PRIVATE_KEY=/PATH/TO/YOUR/PK
    export EC2_CERT=/PATH/TO/YOUR/CERT
  
    # 
    export AWS_TOOLS_HOME=/PATH/TO/AWS_TOOLS/CLONE
    # source the aws-tools-env
    . AWS_TOOLS_HOME/aws-tools-env.sh
    ...
    ```
    
That's all it should take.  Please reach out to me if you have trouble installing and using.

## work at bizo
If you want to work a large systems across multiple regions on AWS or on big data problems with passionate developers [email me](mailto:donnie@bizo.com).  Also check out [Bizo's dev blog](http://dev.bizo.com)

## updates => pull requests accepted 
We will try to keep this as up-to-date as possible but will happily accept pull requests for tools with newer releases or even issues noting new tool releases.

## known issues
 * Looks like the cloudsearch credentials file has a different format than the other tools that use credentials file.  This wouldn't be a big deal except for the fact that cloudsearch uses the same name for the environment variable.  



    
    