
import vitis

client = vitis.create_client()
status = client.set_workspace(path="Workspace")
assert status, status

try:
    platform = client.get_component("foo")
except:
    platform = client.create_platform_component(
        name = "foo",
        hw_design = "ublaze_hello.xsa",
        os = "standalone",
        cpu = "microblaze_mcs_0_microblaze_I",
        domain_name = "standalone_microblaze_mcs_0_microblaze_I",
    )
else:
    platform.update_hw("ublaze_hello.xsa")

status = platform.build()
assert status==0, status

assert client.find_platform_in_repos('foo') is not None

try:
    comp = client.get_component("bar")
except:
    comp = client.create_app_component(
        name="bar",
        platform = client.find_platform_in_repos('foo'),
        domain = "standalone_microblaze_mcs_0_microblaze_I",
    )

status = comp.import_files(
    from_loc="",
    files=["ublaze_hello.appl/src"],
)
assert status, status

status = comp.build()
assert status==0, status
