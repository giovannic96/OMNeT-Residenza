package progetto.simulations;

import inet.applications.udpapp.UDPVideoStreamCli;
import inet.applications.udpapp.UDPVideoStreamSvr;
import inet.node.ethernet.Eth1G;
import inet.node.ethernet.Eth10G;
import inet.examples.mobileipv6.fiberline;
import inet.linklayer.ethernet.EtherHub;
import inet.networklayer.configurator.generic.GenericNetworkConfigurator;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.AdhocHost;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.node.inet.WirelessHost;
import inet.node.internetcloud.InternetCloud;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import ned.DatarateChannel;

@license(LGPL);
//
// TODO documentation
//
network Network
{
    @display("bgb=784.86005,683.508,#E2F0FE;bgl=2");
    types:
        channel fiberline extends DatarateChannel
        {
            delay = 1us;
            datarate @display("ls=green") = 10Gbps;

            @display("ls=#80FF80");
        }
    submodules:
        configurator: IPv4NetworkConfigurator {
            @display("p=712,31");
        }
        router: Router {
            @display("p=173,403");
        }
        router1: Router {
            @display("p=173,104");
        }
        SwitchAulaStudio: EtherSwitch {
            @display("p=291,408");
        }
        SwitchSalaSvago: EtherSwitch {
            @display("p=310,361");
        }
        SwitchUffici: EtherSwitch {
            @display("p=271,177");
        }
        SwitchDormitorio: EtherSwitch {
            @display("p=271,36");
        }
        accessPoint: AccessPoint {
            @display("p=444,498");
        }
        accessPoint1: AccessPoint {
            @display("p=453,389");
        }
        accessPoint2: AccessPoint {
            @display("p=410,73");
        }
        accessPoint3: AccessPoint {
            @display("p=502,57");
        }
        accessPoint4: AccessPoint {
            @display("p=591,36");
        }
        etherHub: EtherHub {
            @display("p=299,517");
        }
        etherHub1: EtherHub {
            @display("p=385,203");
        }
        etherHub2: EtherHub {
            @display("p=483,203");
        }
        etherHub3: EtherHub {
            @display("p=623,191");
        }
        wirelessHost[10]: WirelessHost {
            @display("p=449,556;i=device/wifilaptop");
        }
        standardHost: StandardHost {
            @display("p=384.396,273.156");
        }
        standardHost1: StandardHost {
            @display("p=482.04,273.156");
        }
        standardHost2: StandardHost {
            @display("p=622.94403,273.156");
        }
        standardHost3: StandardHost {
            @display("p=278.1,625.416");
        }
        standardHost4: StandardHost {
            @display("p=388.104,625.416;i=device/printer");
        }
        router2: Router {
            @display("p=39,305");
        }
        DataServer: StandardHost {
            @display("p=45,483;i=device/server2");
        }
        WebServer: StandardHost {
            @display("p=41,172;i=device/server");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=648.528,585.324");
        }
        wirelessHost1[10]: WirelessHost {
            @display("p=376.476,122.286;i=device/cellphone");
        }
        wirelessHost2[10]: WirelessHost {
            @display("p=442.428,116.79");
        }
        wirelessHost3[10]: WirelessHost {
            @display("p=509.754,118.164;i=device/cellphone");
        }
        wirelessHost4[10]: WirelessHost {
            @display("p=648.528,103.05;i=device/cellphone");
        }
        wirelessHost5[10]: WirelessHost {
            @display("p=568.836,122.286");
        }
        wirelessHost6[10]: WirelessHost {
            @display("p=692.496,100.302");
        }
        SmartTV: WirelessHost {
            @display("p=548.226,454.794;i=-");
        }
        wirelessHost7[10]: WirelessHost {
            @display("p=542.73,383.346");
        }
    connections:
        // fiberline a 10Gbps
        router.ethg++ <--> fiberline { @display("ls=green"); } <--> router2.ethg++;
        router1.ethg++ <--> fiberline { @display("ls=green"); } <--> router2.ethg++;
        router2.ethg++ <--> fiberline { @display("ls=green"); } <--> WebServer.ethg++;
        router2.ethg++ <--> fiberline { @display("ls=green"); } <--> DataServer.ethg++;
        router.ethg++ <--> fiberline { @display("ls=green"); } <--> SwitchAulaStudio.ethg++;
        router.ethg++ <--> fiberline { @display("ls=green"); } <--> SwitchSalaSvago.ethg++;
        router1.ethg++ <--> fiberline { @display("ls=green"); } <--> SwitchUffici.ethg++;
        router1.ethg++ <--> fiberline { @display("ls=green"); } <--> SwitchDormitorio.ethg++;
        //Ethernet 1Gbps
        SwitchAulaStudio.ethg++ <--> Eth1G { @display("ls=red"); } <--> accessPoint.ethg++;
        SwitchSalaSvago.ethg++ <--> Eth1G { @display("ls=red"); } <--> accessPoint1.ethg++;
        SwitchDormitorio.ethg++ <--> Eth1G { @display("ls=red"); } <--> accessPoint2.ethg++;
        SwitchDormitorio.ethg++ <--> Eth1G { @display("ls=red"); } <--> accessPoint3.ethg++;
        SwitchDormitorio.ethg++ <--> Eth1G { @display("ls=red"); } <--> accessPoint4.ethg++;

        SwitchAulaStudio.ethg++ <--> Eth1G { @display("ls=red"); } <--> etherHub.ethg++;
        SwitchUffici.ethg++ <--> Eth1G { @display("ls=red"); } <--> etherHub1.ethg++;
        SwitchUffici.ethg++ <--> Eth1G { @display("ls=red"); } <--> etherHub2.ethg++;
        SwitchUffici.ethg++ <--> Eth1G { @display("ls=red"); } <--> etherHub3.ethg++;
        etherHub.ethg++ <--> Eth1G { @display("ls=red"); } <--> standardHost3.ethg++;
        etherHub.ethg++ <--> Eth1G { @display("ls=red"); } <--> standardHost4.ethg++;
        standardHost.ethg++ <--> Eth1G { @display("ls=red"); } <--> etherHub1.ethg++;
        standardHost1.ethg++ <--> Eth1G { @display("ls=red"); } <--> etherHub2.ethg++;
        standardHost2.ethg++ <--> Eth1G { @display("ls=red"); } <--> etherHub3.ethg++;

}

