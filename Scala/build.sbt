name := "Scala"

version := "1.0"

scalaVersion := "2.11.7"

libraryDependencies ++= Seq(
  "com.typesafe.akka" %% "akka-actor" % "2.4-SNAPSHOT",
  "io.mediachain" %% "multihash" % "0.1.0"
)

resolvers += "Akka Snapshot Repository" at "http://repo.akka.io/snapshots/"

ivyScala := ivyScala.value map { _.copy(overrideScalaVersion = true) }