function r = updateFirmwarePluto(release)

!sudo mount /dev/sdf1 /pluto

switch release
    case 'R2017b'
        !wget --no-check-certificate https://github.com/analogdevicesinc/plutosdr-fw/releases/download/v0.26/plutosdr-fw-v0.26.zip
end
!unzip *.zip
!sudo cp pluto.frm /pluto
disp('Unmounting');
!sudo umount /pluto
!dmesg | grep PlutoSDR > now
disp('Ejecting');
!sudo eject /dev/sdf1
disp('Waiting for Pluto to finish');
pause(3);
for k=1:(60*4)
    fprintf('.');
    pause(1);
    !dmesg | grep PlutoSDR > later
    [~,diff] = system('diff now later');
    if ~isempty(diff)
        delete *.zip *.frm *.dfu now later
        fprintf('\n');
        r = true;
        return
    end
end
delete *.zip *.frm *.dfu now later
fprintf('\n');
r = false;

