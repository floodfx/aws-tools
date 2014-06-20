# aws-tools
An up-to-date bundle of all the Amazon Web Services (AWS) command line tools in a single location.

## why?
We've been maintaining a slightly different version of this project internally at Bizo for a couple of years and it has been helpful for us.  We figured it might be useful for others.

Currently, one has to install all of these tools by downloading different zip files from [Amazon](http://aws.amazon.com/developertools/).  It is hard to keep track of what tools have been updated and kind of a PITA to find all of the tools.  We think it is easier to maintain a single project with all the tools in one place.

Note: Our goal is not to be the repository for fixing bugs found in the already packaged tools at this point.

## installation

* Clone project

   ```git clone git://github.com/floodfx/aws-tools.git```

* Update your shell init file (`.bash_profile`, `.profile`, etc.) with:

  ```
  # export AWS environment variables
  export AWS_ACCESS_KEY_ID=<your access key id>
  export AWS_SECRET_ACCESS_KEY=<your secret acess key>
  export AWS_TOOLS=<path to aws-tools working copy>
  # required for ec2-* tools
  export EC2_PRIVATE_KEY=`ls -1 ~/.aws-tools/pk-*.pem|head -1`
  export EC2_CERT=`ls -1 ~/.aws-tools/cert-*.pem|head -1`
  . $AWS_TOOLS/aws-tools-env.sh
  ```

  Calling `aws-tools-env.sh` will setup your `PATH` and other environment variables (`EC2_HOME`, etc.).

* If you're running `ec2-*` commands, your copy `cert-*.pem` and `pk-*.pem` files to `~/.aws-tools`.

That's all it should take.  Please reach out to me if you have trouble installing and using.

## work at bizo
If you want to work a large systems across multiple regions on AWS or on big data problems with passionate developers [email me](mailto:donnie@bizo.com).  Also check out [Bizo's dev blog](http://dev.bizo.com)

## updates => pull requests accepted 
We will try to keep this as up-to-date as possible but will happily accept pull requests for tools with newer releases or even issues noting new tool releases.

## known issues
 * Looks like the cloudsearch credentials file has a different format than the other tools that use credentials file.  This wouldn't be a big deal except for the fact that cloudsearch uses the same name for the environment variable.

## License

Licensed under the terms of the Apache Software License v2.0. 

http://www.apache.org/licenses/LICENSE-2.0.html
