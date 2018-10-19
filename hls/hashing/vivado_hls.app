<project xmlns="com.autoesl.autopilot.project" name="hashing" top="jenkins_one_at_a_time">
    <files>
        <file name="hashing/jenkins_hash.c" sc="0" tb="false" cflags=""/>
        <file name="hashing/search.c" sc="0" tb="false" cflags=""/>
        <file name="../jenkins_hash_test.c" sc="0" tb="1" cflags=""/>
    </files>
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0" compiler="true"/>
    </Simulation>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

