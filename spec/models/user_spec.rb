require 'spec_helper'

describe 'User with timestamped columns' do
  describe 'Sanity' do
    before(:each) do
      @user = User.new({
        :name => 'Joe User'
      })
    end

    it 'should initialize' do
      @user.should be_a_kind_of User
    end

    it 'should have the specified factory defaults' do
      @user.name.should match 'Joe User'
      @user.email.should be_nil
      @user.phone.should be_nil
    end

    it 'should persist' do
      @user.save
      @user.should be_persisted
    end
  end


  describe 'Non-persisted models' do
    before(:each) do
      @user = User.new({
        :name => 'Joe User'
      })
    end

    it 'should not have timestamped columns set' do
      @user.name_updated_at.should be_nil
      @user.email_updated_at.should be_nil
    end
  end


  describe 'Persisting models' do
    before(:each) do
      @user = User.new({
        :name => 'Joe User'
      })
    end

    it 'should set timestamped column values on create for attributes with set values' do
      @user.save

      @user.name_updated_at.should be_a_kind_of Time
      @user.email_updated_at.should be_nil
    end

    it 'should set timestamped column values for multiple attributes' do
      @user.email = 'joe.user@email.com'
      @user.phone = '123-456-7890'
      @user.save

      @user.name_updated_at.should be_a_kind_of Time
      @user.email_updated_at.should be_a_kind_of Time
    end
  end

  describe 'Updating models' do
    before(:each) do
      @user = User.create({
        :name  => 'Joe User',
        :email => 'joe.user@email.com',
        :phone => '123-456-7890'
      })
    end

    it 'should update non-timestamped fields without updating any timestamped fields (part 1)' do
      expect {
        @user.phone = '000-000-0000'
        @user.save
      }.to_not change { @user.name_updated_at.to_i }
    end

    it 'should update non-timestamped fields without updating any timestamped fields (part 2)' do
      expect {
        @user.phone = '000-000-0000'
        @user.save
      }.to_not change { @user.email_updated_at.to_i }
    end

    it 'should update an attributes timestamped column if the attribute changes' do
      in_the_future do
        expect {
          @user.name = 'John Blogs'
          @user.save
        }.to change { @user.name_updated_at.to_i }
      end
    end

    it 'should not update another timestamp column if a different timestamped attribute changes' do
      in_the_future do
        expect {
          @user.name = 'John Blogs'
          @user.save
        }.to_not change { @user.email_updated_at.to_i }
      end
    end

    it 'should allow updating of timestamp columns without complaint' do
      time = 1.day.ago

      @user.name_updated_at = time
      @user.name_updated_at.should equal time

      @user.save
      @user.name_updated_at.should equal time
    end
  end
end
