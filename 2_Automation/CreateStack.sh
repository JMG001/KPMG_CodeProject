aws cloudformation create-stack
    --stack-name SimpleAppStack 
    --template-body file://BuildInfra.json 
    --parameters ParameterKey=KeyName,ParameterValue=MyKeyPair ParameterKey=WebInstanceType,ParameterValue=t2.small Parameterkey=SSHLocation,ParameterValue=0.0.0.0/0 ParameterKey=DBUser,ParameterValue=DBAdminUser ParameterKey=DBPassword,ParameterValue=DBAdminPassword ParameterKey=WebAppRG,ParameterValue=WebAppResGrp

if ! [ "$?" = "0" ]; then
	exitWithErrorMessage "Cannot create stack ${stackName}!"
fi

#Wait for completion
waitForState SimpleAppStack "CREATE_COMPLETE"
