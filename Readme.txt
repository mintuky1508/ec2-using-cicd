before run this script we need to create IAM and configure with gubhub. as below mentioned step
(#AWS configure with github.)

  
#inside AWS work and create services.
1. create IAM user and attache full access policy.
2. go to inside IAM user and create access key and secret key

#perform action inside github.
1. create repo and push code you want run 
2. create .github/workflows/xyz.yml and paste it script
3. go to setting inside repo (setting>....)
4. and create credentional and put propername.

  do any chages and commit you can see your pipeline is runing.
