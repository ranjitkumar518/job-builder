env=`grep env variables.yaml |awk -F: '{print $2}'`
jobtype=`grep job_type variables.yaml |awk -F: '{print $2}'`

# Get Jenkins-Job-Builder Home
jjb_home="/usr/local/bin/jenkins-jobs"
echo $jjb_home $jobtype $env
user_home="/Users/ranjitkumar/jobs/CI-Jobs" 

# comparing variable and execute command to create a job

if [ $env == DEV ]; then

   if [ $jobtype == Gsf ]; then
      echo "This is GSF dev job"
      cat $workspace/$JOB_NAME/variables.yaml >> $user_home/GSF_DEV/variables.yaml
      echo "Job builder is about to create a Gsf DEV job "
      $jjb_home update $user_home/GSF_DEV/
   elif [ $jobtype == Nongsf ]; then
      echo "This is a Non GSF dev Job"
      cat $workspace/$JOB_NAME/variables.yaml >> $user_home/NONGSF_DEV/
      echo "Job builder is about to create a Nongsf job "
      $jjb_home update $user_home/NONGSF_DEV/
   else
      echo "User Input is not valid"
      exit 1
   fi
fi

if [ $env == UAT ]; then

   if [ $jobtype == Gsf ]; then
      echo "This is GSF UAT Job"
      cat $workspace/$JOB_NAME/variables.yaml >> $user_home/GSF_UAT/variables.yaml
      echo "Job builder is about to create a Gsf UAT job "
      $jjb_home update $user_home/GSF_UAT/
   elif [ $jobtype == Nongsf ]; then
      echo "This is a Non GSF UAT Job"
      cat $workspace/$JOB_NAME/variables.yaml >> $user_home/jobs/CI_Jobs/NONGSF_UAT/
      echo "Job builder is about to create a Nongsf UAT job "
      $jjb_home update $user_home/NONGSF_UAT/
   else
      echo "User Input is invalid"
      exit 1
   fi
fi

if [ $env == IT ]; then

   if [ $jobtype == Gsf ]; then
      echo "This is GSF IT Job"
      cat $workspace/$JOB_NAME/variables.yaml >> $user_home/GSF_IT/
      echo "Job builder is about to create a Gsf IT job "
      $jjb_home update $user_home/GSF_IT/
   elif [ $jobtype == Nongsf ]; then
      echo "This is a Non GSF IT Job"
      cat $workspace/$JOB_NAME/variables.yaml >> $user_home/NONGSF_IT/
      echo "Job builder is about to create a Nongsf IT job "
      $jjb_home update $user_home/jobs/NONGSF_IT/
   else
      echo "User Input is Invalid"
      exit 1
   fi
fi
