//
//  AddReminderView.swift
//  My App
//
//  Created by Kailey Liou on 8/24/25.
//

import SwiftUI

struct AddReminderView: View {
    @Binding var reminders : [Reminder]
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var date = Date()
    @State private var type = "Vaccine"
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(red: 0.97, green: 0.96, blue: 0.92)
                    .ignoresSafeArea()
                
                VStack {
                    Text("New Reminder")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                        .foregroundColor(.black.opacity(0.8))
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    
                    VStack(spacing: 20) {
                        TextField("Enter reminder title", text: $title)
                            .padding()
                            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .cornerRadius(10)
                        
                        DatePicker("Select Date", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding()
                            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .cornerRadius(10)
                        
                        Picker("Reminder Type", selection: $type) {
                            Text("Vaccine").tag("Vaccine")
                            Text("Screening").tag("Screening")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 20)
                    
                    Button(action: {
                        let newReminder = Reminder(title: title, date: date, type: type)
                        reminders.append(newReminder)
                        NotificationManager.scheduleNotification(for: newReminder)
                        dismiss()
                    }) {
                        Text("Save Reminder")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(title.isEmpty ? Color.gray : Color(red: 0.40, green: 0.50, blue: 0.35))
                            .foregroundColor(title.isEmpty ? Color.white.opacity(0.7) : Color.white)
                            .cornerRadius(15)
                    }
                    .disabled(title.isEmpty)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                dismiss()
                            }
                            .foregroundColor(.black.opacity(0.8))
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(Color(red: 0.97, green: 0.96, blue: 0.92), for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                }
                
            }
            
        }
    }
}

#Preview {
    AddReminderView(reminders: .constant([]))
}
