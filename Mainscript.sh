# To Exit on Error
set -e
# Grep Inputs from variables.yaml file 
env=`grep env variables.yaml |awk -F: '{print $2}'`
jobtype=`grep job_type variables.yaml |awk -F: '{print $2}'`

# Get Jenkins-Job-Builder Home
jjb_home=/usr/local/bin/jenkins-jobs
# print values
echo $jjb_home $jobtype $env
# common variables to reuse in the script
user_home=/Users/ranjitkumar/jobs/CI-Jobs 
workspace1=/Users/Shared/Jenkins/Home/workspace/job-builder

# Comparing variables job_type and env to create a job by executing a command command
# Comparing with DEV Environment
if [ $env == DEV ]; then

   if [ $jobtype == Gsf ]; then
      echo "This is GSF dev job"
      sudo cat $workspace1/variables.yaml > $user_home/GSF_DEV/variables.yaml
      echo "Job builder is about to create a Gsf DEV job "
      $jjb_home update $user_home/GSF_DEV/
   elif [ $jobtype == Nongsf ]; then
      echo "This is a Non GSF dev Job"
      sudo cat $workspace1/variables.yaml > $user_home/NONGSF_DEV/variables.yaml
      echo "Job builder is about to create a Nongsf job "
      $jjb_home update $user_home/NONGSF_DEV/
   else
      echo "User Input is not valid"
      exit 1
   fi
fi

# Comparing with UAT Environment

if [ $env == UAT ]; then

   if [ $jobtype == Gsf ]; then
      echo "This is GSF UAT Job"
      sudo cat $workspace1/variables.yaml > $user_home/GSF_UAT/variables.yaml
      echo "Job builder is about to create a Gsf UAT job "
      $jjb_home update $user_home/GSF_UAT/
   elif [ $jobtype == Nongsf ]; then
      echo "This is a Non GSF UAT Job"
      sudo cat $workspace1/variables.yaml > $user_home/NONGSF_UAT/variables.yaml
      echo "Job builder is about to create a Nongsf UAT job "
      $jjb_home update $user_home/NONGSF_UAT/
   else
      echo "User Input is invalid"
      exit 1
   fi
fi

# Comparing with IT Environment

if [ $env == IT ]; then

   if [ $jobtype == Gsf ]; then
      echo "This is GSF IT Job"
      echo $workspace
      sudo cat $workspace1/variables.yaml > $user_home/GSF_IT/variables.yaml
      echo "Job builder is about to create a Gsf IT job "
      $jjb_home update $user_home/GSF_IT/
   elif [ $jobtype == Nongsf ]; then
      echo "This is a Non GSF IT Job"
      sudo cat $workspace1/variables.yaml > $user_home/NONGSF_IT/variables.yaml
      echo "Job builder is about to create a Nongsf IT job "
      $jjb_home update $user_home/NONGSF_IT
   else
      echo "User Input is Invalid"
      exit 1
   fi
fi
