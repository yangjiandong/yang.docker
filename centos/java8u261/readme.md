java8 in docker
===

## m


docker 启动
```
  -m1g \
  --cpus=2 \
  -e JAVA_OPTS='-Xms 512m -Xmx 2g' \
```

`java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -cp . Docker`
Number of processors: 2
Max memory: 247 m

memory 大概是 1/4

`java $JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -cp . Docker`
Number of processors: 2
Max memory: 1820m

CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "java-and-docker.jar"]
