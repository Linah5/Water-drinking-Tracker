import SwiftUI
import UserNotifications

struct Screen2: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Notification Preferences")
                .bold()
                .font(.title2)
                .padding(.trailing, 50)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)

            Text("The start and End hour")
                .bold()
                .padding(.bottom, 10)

            Text("Specify the start and end time to receive the notifications")
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)
                .font(.system(size: 16))

          
            VStack(spacing: 0) {
             
                HStack {
                    Text("Start hour")
                        .font(.body)

                    Spacer()

             
                    DatePicker("", selection: $userData.selectedStartTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding(.horizontal, 10)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                        .frame(width: 100)
                        .environment(\.locale, Locale(identifier: "us"))

                    Picker("", selection: $userData.timePeriodStart) {
                        Text("AM").tag("AM")
                        Text("PM").tag("PM")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 80)
                }
                .padding()
                .background(Color(UIColor.systemGray6))

                Divider()
                    .background(Color(UIColor(white: 0.9, alpha: 0.2)))
                    .frame(height: 1)
                    .padding(.horizontal, 10)
                    .padding(.top, 5)

             
                HStack {
                    Text("End hour")
                        .font(.body)

                    Spacer()

               
                    DatePicker("", selection: $userData.selectedEndTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding(.horizontal, 10)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                        .frame(width: 100)
                        .environment(\.locale, Locale(identifier: "us"))

                    Picker("", selection: $userData.timePeriodEnd) {
                        Text("AM").tag("AM")
                        Text("PM").tag("PM")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 80)
                }
                .padding()
                .background(Color(UIColor.systemGray6))
            }
            .background(Color(UIColor.systemGray6))

            Spacer(minLength: 30)

            VStack(alignment: .leading) {
                Text("Notifications interval")
                    .bold()
                    .fontWeight(.semibold)
                    .padding(.top, 10)

                Text("How often would you like to receive notifications within the specified time interval")
                    .fontWeight(.light)
                    .font(.system(size: 16))
                    .padding(.top, 3)

                LazyVGrid(columns: Array(repeating: GridItem(.fixed(80), spacing: 15), count: 4), spacing: 15) {
                    ForEach(["15 Mins", "30 Mins", "60 Mins", "90 Mins", "2 Hours", "3 Hours", "4 Hours", "5 Hours"], id: \.self) { interval in
                        VStack(spacing: 2) {
                            let components = interval.split(separator: " ")
                            if components.count == 2 {
                                Text(components[0])
                                    .foregroundColor(userData.selectedInterval == interval ? Color.white : Color.cyan)
                                    .font(.headline)

                                Text(components[1])
                                    .foregroundColor(userData.selectedInterval == interval ? Color.white : Color.black)
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .padding(5)
                        .background(userData.selectedInterval == interval ? Color.cyan : Color(UIColor.systemGray6))
                        .cornerRadius(8)
                        .onTapGesture {
                            userData.selectedInterval = interval
                        }
                    }
                }
                .padding(.bottom)
            }

            Spacer()

            
            NavigationLink(destination: Screen3(userData: userData)) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top)
            .simultaneousGesture(TapGesture().onEnded {
                userData.requestNotificationPermission()
                userData.scheduleNotifications()
            })
        }
        .padding()
    }
}


#Preview {
    Screen2(userData: UserData())
}

