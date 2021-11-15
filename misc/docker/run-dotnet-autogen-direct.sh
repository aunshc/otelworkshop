docker run --rm -dit \
-e SIGNALFX_SERVICE_NAME=dotnet-autogen-direct \
-e SIGNALFX_ENDPOINT_URL=https://ingest.$SPLUNK_REALM.signalfx.com/v2/trace \
-e SIGNALFX_ACCESS_TOKEN=$SPLUNK_ACCESS_TOKEN \
-e SIGNALFX_ENV=apm-workshop \
-e CORECLR_ENABLE_PROFILING=1 \
-e CORECLR_PROFILER="{B4C89B0F-9908-4F73-9F59-0D77C5A06874}" \
-e CORECLR_PROFILER_PATH=/opt/signalfx-dotnet-tracing/SignalFx.Tracing.ClrProfiler.Native.so \
-e SIGNALFX_INTEGRATIONS=/opt/signalfx-dotnet-tracing/integrations.json \
-e SIGNALFX_DOTNET_TRACER_HOME=/opt/signalfx-dotnet-tracing \
--name dotnet-autogen-direct docker.io/stevelsplunk/splk-dotnet5

docker exec -it dotnet-autogen-direct /bin/sh /App/run-client.sh