REPOSITORY="/home/ubuntu/kotlin-toy-project"
cd $REPOSITORY

APP_NAME=koomart
#JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'koomart-0.0.1-SNAPSHOT.jar' | tail -n 1)
JAR_NAME='koomart-0.0.1-SNAPSHOT.jar' # .jar 이름 명시
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 종료할 것 없음"
else
  echo "> kill -9 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_PATH 배포"
nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &