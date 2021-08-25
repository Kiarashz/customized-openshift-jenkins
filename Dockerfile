FROM jenkins/jenkins:lts-jdk11

# Skip initial setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false" 
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV OPENSHIFT_ENABLE_OAUTH="true"

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

WORKDIR $JENKINS_HOME
