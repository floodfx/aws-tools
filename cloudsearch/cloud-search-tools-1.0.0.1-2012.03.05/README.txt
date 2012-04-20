Amazon CloudSearch Command Line Tools
======================================

The Amazon CloudSearch command line tools wrap the Amazon CloudSearch APIs to
enable you to easily interact with Amazon CloudSearch from the command line of
your preferred shell.

The latest version of the Amazon CloudSearch command line tools is available
at http://docs.amazonwebservices.com/general/latest/gr/commandlinetools.html.

== Requirements ==

- Java 6 (or later) JRE
- An AWS account with access to Amazon CloudSearch

== Installation ==

1. Unpack the .zip (Windows) or .tgz (Linux/MacOS/UNIX) file. On Windows, we
   recommend unzipping the tools in the C:\CloudSearch directory. 

2. Set the CS_HOME environment variable to point to the directory where you
   unpacked the tools.

   On Linux and UNIX, enter following command:
      > export CS_HOME=install_directory_path
       
   On Windows, enter the following command:
      > set CS_HOME=install_directory_path

3. Add the CS_HOME environment variable to your PATH.

   On Linux and UNIX, enter following command:
      > export PATH=$PATH:$CS_HOME/bin
      
   On Windows, enter the following command:
      > set PATH=%PATH%;%CS_HOME%\bin

4. Make sure you have the Java 6 (or later) JRE installed and the $JAVA_HOME
   environment variable is set to the full path of the directory that contains
   the bin directory in which the Java executable resides. For information
   about checking your Java installation, go to java.com.

5. Configure the command line tools to use your AWS identifiers. The Amazon
   CloudSearch command line tools look for your AWS identifiers in a text file
   on your local system in the location specified by the AWS_CREDENTIAL_FILE 
   environment variable. 
   
   If you have not already configured an AWS credential file:
   
   a. Use a text editor to create a two-line text file that specifies your 
      AWS identifiers. The first line sets the accessKey property and the 
      second line sets the secretKey property. For example:
         
         accessKey=AKIAIOSFODNN7EXAMPLE
         secretKey=wJalrXUtnFEMI/K7MDENG/bPxRfiCYzEXAMPLEKEY
         
   b. Save the file with any name you want (for example, account-key).
   
   c. Set the file permissions to limit access to only the file owner.
      (For example, use chmod 600 on the file if you're using Linux/UNIX).
      
   d. Set the AWS_CREDENTIAL_FILE environment variable.
      
      On Linux and UNIX, enter following command:
         > export AWS_CREDENTIAL_FILE=credential_file_path
         
      On Windows, enter the following command:
         > set AWS_CREDENTIAL_FILE=credential_file_path

6. Verify that the Amazon CloudSearch tools are configured correctly by 
   running the cs-describe-domain command. (Since you haven't configured 
   any search domains yet, the Domain Summary will be empty.)
   
   > cs-describe-domain
   
   If you get an error, check the following:
   
   - If the system cannot find the specified path, your JAVA_HOME environment 
     variable needs to be set to the location where you have the JRE installed. 
     For example, C:\Program Files\Java\jre6.
      
   - If cs-describe-domain is not recognized as a command, check your PATH and
     make sure it contains the bin directory for the command line tools. For 
     example, /Users/username/CloudSearch/tools/bin.
      
   - If you get an InvalidClientTokenId error, your AWS credentials are not 
     configured correctly. Make sure that you've configured the 
     AWS_CREDENTIAL_FILE environment variable and that your
     credential file contains valid AWS identifiers.

== Usage ==

Use the -h (--help) option to view usage information for any of the Amazon 
CloudSearch commands. 

cs-configure-access-policies
cs-configure-fields
cs-configure-from-sdf
cs-configure-ranking
cs-configure-text-options
cs-create-domain
cs-delete-domain
cs-describe-domain
cs-generate-sdf
cs-index-documents
cs-post-sdf

For more information, see the Amazon CloudSearch documentation at
http://aws.amazon.com/documentation/cs/.