
import vitis

client = vitis.create_client()
status = client.set_workspace(path="Workspace")
assert status, status

platform = client.create_platform_component(
    name = "foo",
    hw_design = "ublaze_hello.xsa",
    os = "standalone",
    cpu = "microblaze_mcs_0_microblaze_I",
    domain_name = "standalone_microblaze_mcs_0_microblaze_I",
)


#platform_xpfm=client.find_platform_in_repos(plat_name)
status = platform.build()
assert status==0, status

print('XXX', client.find_platform_in_repos('foo'))

comp = client.create_app_component(
    name="bar",
    platform = client.find_platform_in_repos('foo'),
    domain = "standalone_microblaze_mcs_0_microblaze_I",
)

status = comp.import_files(
    from_loc="",
    files=["/home/xilinx/Osprey/ublaze_hello/ublaze_hello.appl/src"],
)
assert status, status

status = comp.build()
assert status==0, status
